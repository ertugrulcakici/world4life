class User {
  int? id;
  String? username;
  String? email;

  User({this.id, this.username, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['ID']?.toInt() ?? 0;
    username = json['username'];
    email = json['email'];
  }

}
