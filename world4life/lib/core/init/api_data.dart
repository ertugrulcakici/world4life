class ApiData {
  final String _urlPublic = "http://151.250.24.245:8000/";
  final String _urlPrivate = "http://192.168.1.25:8000/";

  String get url => _urlPublic;
  String get getImageUrl => "http://192.168.1.25:8080/" + "images/";
}
