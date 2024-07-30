

import 'package:nijyu/constant/strings.dart';
import 'package:nijyu/validator/validator.dart';

class RequiredValidator implements Validator<String?> {
  @override
  bool validate(String? value) {
    if (value == null) {
      return false;
    }

    return value.trim().isNotEmpty;
  }

  @override
  String getMessage() => Strings.requiredValidatorMessage;
}