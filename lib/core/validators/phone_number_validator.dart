
import 'base_validator.dart';

class PhoneNumValidator extends BaseValidator {

  final int minLength;


  PhoneNumValidator({required this.minLength});

  @override
  String getValidateMessage() {
    return "Phone number is not valid";
  }

  @override
  bool validateFunction(String? value) {
    return value != null? value.length >= minLength ? true : false : false;
  }

}