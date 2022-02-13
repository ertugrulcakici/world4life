import hashlib


def encrypt(data):
    return hashlib.md5(bytes(data,"utf-8")).hexdigest()


class ResponseModel:
    def __init__():
        pass

class DatabaseResponseModel:
    def __init__(self,status=None,message=None,data=None) -> None:
        self.status = status
        self.message = message
        self.data = data

    def hasData(self):
        if self.data is not None:
            if len(self.data) > 0:
                return True
    
    def firstRow(self,index = None):
        if index is None:
            return self.data[0]
        else:
            return self.data[0][index]