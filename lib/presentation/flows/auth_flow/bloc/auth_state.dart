import 'package:equatable/equatable.dart';
enum ValidateStatus {init,validated,unValidated}
class AuthState extends Equatable {
  const AuthState(
      { this.changeStatus=ValidateStatus.init});


  final ValidateStatus changeStatus;

  AuthState copyWith({
    ValidateStatus? changeStatus,
  }){
    return  AuthState(
      changeStatus: changeStatus??this.changeStatus
    );
}

  @override

  List<Object?> get props => [changeStatus];


}