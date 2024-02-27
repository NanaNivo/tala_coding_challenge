import 'package:tala_coding_challenge/core/mediators/bloc_hub/bloc_member.dart';
import 'package:bloc/bloc.dart';
import 'package:tala_coding_challenge/core/mediators/communication_types/base_communication.dart';
import 'package:tala_coding_challenge/presentation/flows/auth_flow/bloc/auth_event.dart';
import 'package:tala_coding_challenge/presentation/flows/auth_flow/bloc/auth_state.dart';
class AuthBloc extends Bloc<AuthEvent, AuthState> with BlocMember {
  AuthBloc() :super(const AuthState()) {
/// App Events
on<ValidatePhoneNumber>(_onValidatePhoneNumber);
}

  @override
  void receive(String from, CommunicationType data) {
    // TODO: implement receive
  }
}
extension AuthBlocMappers on AuthBloc {
  void _onValidatePhoneNumber(ValidatePhoneNumber event,
      Emitter<AuthState> emit) async {
       if(event.isValidate)
         {
           emit(state.copyWith(changeStatus: ValidateStatus.validated));
         }
       else
         {
           emit(state.copyWith(changeStatus: ValidateStatus.unValidated));
         }

  }
}