
import 'package:nijyu/constant/strings.dart';
import 'package:nijyu/validator/validator.dart';

class AgeValidator implements Validator<String> {
  @override
  bool validate(String value) {
    final age = int.tryParse(value);
    if (age == null) {
      return false;
    }

    return age >= 0;
  }

  @override
  String getMessage() => Strings.ageValidatorMessage;
}