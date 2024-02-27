abstract  class AuthEvent {}
class ValidatePhoneNumber extends AuthEvent
{
   bool isValidate;
   ValidatePhoneNumber(this.isValidate);
}