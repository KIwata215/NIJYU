import 'package:nijyu/constant/strings.dart';
import 'package:nijyu/validator/validator.dart';

class EmailValidator implements Validator<String>{
  

  @override
  bool validate(String value) {
     // メールアドレスの正規表現バリデーション
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value);
  }
  @override
  String getMessage() => Strings.emailValidatorMessage;
}