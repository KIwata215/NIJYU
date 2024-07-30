class ValidationUtils {
  // 名前のバリデーションチェック
  static String validateName(String value) {
    if (value.isEmpty) {
      return '名前を入力してください';
    }
    return '';
  }

  // メールアドレスのバリデーションチェック
  static String validateEmail(String value) {
    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (value.isEmpty) {
      return 'メールアドレスを入力してください';
    } else if (!emailRegExp.hasMatch(value)) {
      return '有効なメールアドレスを入力してください';
    }
    return '';
  }

  // 電話番号のバリデーションチェック
  static String validateTelephone(String value) {
    final telephoneRegExp = RegExp(
        r'^\d{10,11}$');
    if (value.isEmpty) {
      return '電話番号を入力してください';
    } else if (!telephoneRegExp.hasMatch(value)) {
      return '有効な電話番号を入力してください';
    }
    return '';
  }
}
