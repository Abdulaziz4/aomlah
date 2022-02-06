class AuthException implements Exception {
  final String code;
  AuthException(this.code);
  String get message {
    switch (code) {
      case "Invalid login credentials":
        return "البريد الالكتروني أو الرقم السري غير صحيح";
      case "User already registered":
        return "البريد الالكتروني مستخدم سابقاً";
      default:
        return "حدث خطأ ما، الرجاء المحاولة لاحقاً";
    }
  }
}
