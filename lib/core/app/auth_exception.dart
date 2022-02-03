class AuthException implements Exception {
  final String code;
  AuthException(this.code);
  //TODO: Migrate messages to supabase
  String get message {
    switch (code) {
      case "email-already-in-use":
        return "الايميل المدخل مستخدم سابقاً";

      case "invalid-email":
        return "الايميل غير صالح";

      case "operation-not-allowed":
        return "حدث خطأ ما، الرجاء المحاولة لاحقاً";

      case "weak-password":
        return "كلمة السر ضعيفة";

      case "wrong-password":
        return "البريد الالكتروني أو الرقم السري غير صحيح";

      case "user-not-found":
        return "البريد الالكتروني أو الرقم السري غير صحيح";

      case "user-disabled":
        return "هذا الحساب غير مفعل";

      case "invalid-action-code":
        return "الكود المدخل غير صالح";

      case "expired-action-code":
        return "الكود المدخل منهي الصلاحية";

      default:
        return "حدث خطأ ما، الرجاء المحاولة لاحقاً";
    }
  }
}
