
from enum import Enum
from flask import request,Response,Flask,g
import json
import sqlite3
import hashlib
from datetime import datetime
import models, helpers
from helpers import DatabaseHelper


app = Flask(__name__)


def encrypt(data):
    return hashlib.md5(bytes(data,"utf-8")).hexdigest()


class ResponseTypes(Enum):
    UNKNOWN = "Bilinmeyen"
    USER_EXISTS= "Kullanıcı mevcut",
    USER_NOT_EXISTS= "Kullanıcı mevcut değil",
    USER_PASSWORD_INCORRECT= "Şifre yanlış",
    USER_CREATED= "Kullanıcı oluşturuldu",
    USER_NOT_CREATED = "Kullanıcı oluşturulamadı",
    USER_DELETED= "Kullanıcı silindi",
    USER_UPDATED= "Kullanıcı bilgisi güncellendi",
    USER_NOT_LOGGED_IN= "Kullanıcı giriş yapmamış",
    USER_LOGGED_IN= "Kullanıcı giriş yaptı",
    USER_LOGGED_OUT= "Kullanıcı çıkış yaptı",
    USER_NOT_LOGGED_OUT= "Kullanıcı çıkış yapamadı",


# get post -> search ile
# add post

databaseHelper = DatabaseHelper()
###############################################################################################

@app.route("/images/<image_path>", methods=['GET'])
def image(image_path):
    return Response(open("images/"+image_path, 'rb').read(), mimetype="image/jpeg")

@app.route("/login", methods=['POST'])
def login():
    data = request.form.to_dict()
    username = data["username"]
    password = data["password"]
    password_encrypted = encrypt(password)

    data = databaseHelper.executeRaw("SELECT ID,username,password,mail,token FROM users WHERE username = ?",(username,))
    if data.hasData():
        if data.firstRow(index=2) == password_encrypted:
            newtoken = encrypt(str(username+str(datetime.now())))
            response = databaseHelper.executeCommit("UPDATE users SET token = ? WHERE username = ?",(newtoken,username))
            if response.status == "OK":
                data = data.firstRow()
                ID = data[0]
                username = data[1]
                password = data[2]
                mail = data[3]
                return Response(json.dumps({"ID":ID,"username":username,"password":password,"mail":mail,"token":newtoken}),status=200,mimetype="application/json")
            else:
                return Response(json.dumps({"message":ResponseTypes.UNKNOWN.value[0],"type":ResponseTypes.UNKNOWN.name}),status=500,mimetype="application/json")
        else:
            return Response(json.dumps({"message":ResponseTypes.USER_PASSWORD_INCORRECT.value[0],"message":ResponseTypes.USER_PASSWORD_INCORRECT.name}),status=500,mimetype="application/json")
    else:
        return Response(json.dumps({"message":ResponseTypes.USER_NOT_EXISTS.value[0],"type":ResponseTypes.USER_NOT_EXISTS.name}),status=500,mimetype="application/json")



@app.route("/user/<token>")
def getUserInfoViaToken(token): # --> user bilgilerini
    data = databaseHelper.executeRaw("SELECT ID,username,password,mail,token FROM users WHERE token = ?",(token,))
    if data.hasData():
        data = data.firstRow()
        ID = data[0]
        username = data[1]
        password = data[2]
        mail = data[3]
        token = data[4]
        return Response(json.dumps({"ID":ID,"username":username,"password":password,"mail":mail,"token":token}),status=200,mimetype="application/json")
    else:
        return Response(json.dumps({"message":ResponseTypes.USER_NOT_EXISTS.value[0],"type":ResponseTypes.USER_NOT_EXISTS.name}),status=500,mimetype="application/json")

@app.route("/register", methods=['POST'])
def register():
    data = request.form.to_dict()
    username = data["username"]
    mail = data["mail"]
    password = data["password"]
    password_encrypted = encrypt(password)
    token = encrypt(str(username+str(datetime.now())))

    check = databaseHelper.executeRaw("SELECT * FROM users WHERE username=?",(username,))
    if not check.hasData():
        response = databaseHelper.executeCommit("INSERT INTO users(username,password,mail,token) VALUES(?,?,?,?)",(username,password_encrypted,mail,token))
        if response.status == "OK":
            id = databaseHelper.executeRaw("SELECT ID FROM users WHERE username = ?",(username,)).firstRow(index=0)
            return Response(json.dumps({"ID":id,"username":username,"password":password,"mail":mail,"token":token}),mimetype="application/json",status=200)
        else:
            return Response(json.dumps({"message":ResponseTypes.USER_NOT_CREATED.value[0],"type":ResponseTypes.USER_NOT_CREATED.name,"debug_description":"Bilinmeyen sebep:"+response.message}),mimetype="application/json",status=201)
    else:
        return Response(json.dumps({"message":ResponseTypes.USER_EXISTS.value[0],"type":ResponseTypes.USER_EXISTS.name}),status=201,mimetype="application/json")

@app.route("/news")
def news():
    news_results = databaseHelper.executeRaw("SELECT ID,title,description,img_name,created_date,content FROM news")
    news = []
    for data in news_results.data:
        news.append({"ID":data[0],"title":data[1],"description":data[2],"img_name":data[3],"created_date":data[4],"content":data[5]})
    data = {"news":news}
    return Response(json.dumps(data),status=200, mimetype="application/json")

@app.route("/banners")
def banners():
    banners_results = databaseHelper.executeRaw("SELECT ID,img_name,url FROM banners")
    banners = []
    for data in banners_results.data:
        banners.append({"ID":data[0],"img_name":data[1],"url":data[2]})
    data = {"banners":banners}
    return Response(json.dumps(data),status=200, mimetype="application/json")

@app.route("/categories")
def categories():
    categories_results = databaseHelper.executeRaw("SELECT ID,name,description,img_name,auto_notify FROM categories")
    if categories_results.status == "OK":
        categories = []
        for data in categories_results.data:
            categories.append({"ID":data[0],"name":data[1],"description":data[2],"img_name":data[3],"auto_notify":data[4]})
        data = {"categories":categories}
        return Response(json.dumps(data),status=200, mimetype="application/json")
    else:
        return Response(json.dumps({"message":categories_results.message,"type":ResponseTypes.UNKNOWN.name}),status=500,mimetype="application/json")


@app.route("/getpost/<string:area>/<string:subarea>/<int:category>")
def getpost(area,subarea,category):
    basesql = "SELECT w.ID, w.title, w.lang, w.long, w.description, w.img_name, w.isPicked, w.created_date, u.username, w.area, w.subarea, c.description, c.img_name,c.ID category_id, w.created_by, c.img_name  FROM waste_post as w inner join categories as c on w.category_id = c.ID inner join users as u on w.created_by = u.ID  "
    if category == 0:
        sql = basesql+' WHERE w.area like "%?%" and w.subarea like "%?%"'.replace("?",area.replace("*","",1)).replace("?",subarea.replace("*","",1))
    else:    
        sql = basesql+' WHERE w.area like "%?%" and w.subarea like "%?%" category_id = '.replace("?",area.replace("*","",1)).replace("?",subarea.replace("*","",1))+str(category)
    response = databaseHelper.executeRaw(sql)
    if response.status == "OK":
        posts = []
        for data in response.data:
            posts.append({"ID":data[0],"title":data[1],"lang":data[2],"long":data[3],"description":data[4],"img_name":data[5],"isPicked":data[6],"created_date":data[7],"username":data[8],"area":data[9],"subarea":data[10],"category_description":data[11],"category_img_name":data[12],"category_id":data[13],"created_by":data[14]})
        data = {"posts":posts}
        return Response(json.dumps(data),status=200, mimetype="application/json")

    return Response(json.dumps({"message":"getpost"}),status=200,mimetype="application/json")


@app.route("/addpost", methods=['POST'])
def addpost():
    data = request.form.to_dict()
    files = request.files.to_dict()
    title = data["title"]
    lang = data["lang"]
    long = data["long"]
    description = data["description"]
    category_id = data["category_id"]
    isPicked = data["isPicked"]
    created_date = data["created_date"]
    created_by = data["created_by"]
    area = data["area"]
    subarea = data["subarea"]
    img_path = "images/"+str(created_by)+"_"+str(created_date)+".jpeg"

    files["file"].save(img_path)

    response = databaseHelper.executeCommit("INSERT INTO waste_post(title,lang,long,description,category_id,isPicked,created_date,created_by,area,subarea) VALUES(?,?,?,?,?,?,?,?,?,?)",(title,lang,long,description,category_id,isPicked,created_date,created_by,area,subarea))
    if response.status == "OK":
        response = databaseHelper.executeRaw("SELECT * FROM waste_post WHERE created_date = ? and created_by = ?",(created_date,created_by))
        if response.status == "OK":
            response.data = response.firstRow()
            response_data = dict()
            response_data["ID"] = response.data[0]
            response_data["title"] = response.data[1]
            response_data["lang"] = response.data[2]
            response_data["long"] = response.data[3]
            response_data["img_name"] = response.data[4]
            response_data["description"] = response.data[5]
            response_data["category_id"] = response.data[6]
            response_data["isPicked"] = response.data[7]
            response_data["created_date"] = response.data[8]
            response_data["created_by"] = response.data[9]
            response_data["area"] = response.data[10]
            response_data["subarea"] = response.data[11]
            return Response(json.dumps(response_data),status=200,mimetype="application/json")
            


app.run(host="192.168.1.25", port=8000, debug=True)
