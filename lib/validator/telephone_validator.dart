import 'package:nijyu/constant/strings.dart';
import 'package:nijyu/validator/validator.dart';

class TelephoneValidator implements Validator<String> {
  @override
  bool validate(String value) {
    return RegExp(
      r'^\d{10,11}$',
    ).hasMatch(value);
  }

  @override
  String getMessage()=> Strings.telephoneMessage;
}