class UserLoginModel {
  String? username;
  String? password;

  UserLoginModel({this.username, this.password});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = username.toString();
    data['password'] = password.toString();
    return data;
  }
}
