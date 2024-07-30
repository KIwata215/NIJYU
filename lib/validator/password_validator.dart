import 'package:nijyu/constant/strings.dart';
import 'package:nijyu/validator/validator.dart';

class PasswordValidator implements Validator<String>{

  @override
  bool validate(String value) {
    return RegExp(
      r'^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$',
    ).hasMatch(value);
  }

  @override
  String getMessage()=> Strings.passwordvalidatorMessage;
  
}