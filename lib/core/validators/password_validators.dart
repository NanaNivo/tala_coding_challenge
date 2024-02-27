import 'package:flutter/foundation.dart';

import 'base_validator.dart';


class PasswordValidator extends BaseValidator {
  final int minLength;

  PasswordValidator({required this.minLength});

  @override
  String getValidateMessage() {
    return 'password minimum length is $minLength';
  }

  @override
  bool validateFunction(String? value) {
    return value != null?  value.length >= minLength ? true : false : false;
  }
}

class MatchValidator extends BaseValidator {
  final String? text;

  MatchValidator({required this.text});

  @override
  String getValidateMessage() {
    return "the password doesn't match.";
  }

  @override
  bool validateFunction(String? value) {
    return value != null?  value == text ? true : false : false;
  }
}

class PasswordConfirmValidator extends BaseValidator
{
  final String value;
  final String prevouseValue;
  PasswordConfirmValidator({required this.value,required this.prevouseValue});

  @override
  String getValidateMessage() {
    return 'the value not confirm';
  }

  @override
  bool validateFunction(String? value) {
    print("validate conform${ value==prevouseValue}");
    return (value==prevouseValue);
  }

}
