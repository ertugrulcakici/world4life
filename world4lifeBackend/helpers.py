from enum import Enum
from flask import request,Response,Flask,g
import json
import sqlite3
import hashlib
from datetime import datetime
from models import DatabaseResponseModel


def encrypt(data):
    return hashlib.md5(bytes(data,"utf-8")).hexdigest()

class Logger:
    def Log(*args):
        for i in args:
            print(i,end="\t")
        print()

class DatabaseHelper(Logger):
    def __init__(self) -> None:
        pass

    def get_db(self):
        db = getattr(g, '_database', None)
        if db is None:
            db = g._database = sqlite3.connect("world4life.db")
        return db

    def executeCommit(self,sql,args: tuple):
        with self.get_db() as db:
            cursor = db.cursor()
            response = DatabaseResponseModel()
            try:
                cursor.execute(sql,args)
                response.status = "OK"
            except Exception as e:
                response.status = "ERROR"
                response.message = str(e)
            db.commit()
        return response

    def executeRaw(self,sql,args: tuple=None):
        with self.get_db() as db:
            cursor = db.cursor()
            response = DatabaseResponseModel()
            try:
                if args is None:
                    cursor.execute(sql)
                else:
                    cursor.execute(sql,args)
                response.status = "OK"
                response.data = cursor.fetchall()
            except Exception as e:
                response.status = "ERROR"
                response.message = str(e)
        return response

    def get_news(self):
        return self.executeRaw("SELECT * FROM news")

    def get_banners(self):
        return self.executeRaw("SELECT * FROM banners")