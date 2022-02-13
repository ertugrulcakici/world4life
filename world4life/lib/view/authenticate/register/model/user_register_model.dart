class UserRegisterModel {
  String? email;
  String? username;
  String? password;

  UserRegisterModel({this.email, this.username, this.password});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['mail'] = email.toString();
    data['username'] = username.toString();
    data['password'] = password.toString();
    return data;
  }
}
