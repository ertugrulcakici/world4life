class Validator {
   String? userNameValidator(String? userName) {
    userName == null ? userName = "" : userName = userName;

    return null;
  }

   String? passwordValidator(String? password) {
    password == null ? password = "" : password = password;
    if (password.length < 6) {
      return "Parolanız 6 karakterden küçük olamaz!";
    }

    return null;
  }

   String? emailValidator(String? email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email ?? "");
    if (!emailValid) return "Geçerli bir email girin";
    return null;
  }


}
