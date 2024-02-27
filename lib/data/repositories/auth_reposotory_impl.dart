import 'package:dartz/dartz.dart';
import 'package:tala_coding_challenge/core/error/base_error.dart';
import 'package:tala_coding_challenge/core/result/result.dart';
import 'package:tala_coding_challenge/data/datasources/auth_data_source/auth_data_source.dart';



import 'package:tala_coding_challenge/data/requests/auth_request.dart';


import '../../core/services/session_manager.dart';
import '../../domain/repositories/exchange_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource authDataSource;
  final SessionManager sessionManager;

  AuthRepositoryImpl(this.authDataSource, this.sessionManager);

  @override
  Future<Result<BaseError, List<dynamic>?>> getCurrencies() {
    // TODO: implement getCurrencies
    throw UnimplementedError();
  }

  // @override
  // Future<Result<BaseError, dynamic>> setMobileId(SetMobileIdRequest setMobileIdRequest) {
  //   // TODO: implement setMobileId
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Result<BaseError, InitModel>> setMobileId(SetMobileIdRequest setMobileIdRequest) async {
  //   final result = await authDataSource.setMobileId(setMobileIdRequest);
  //   if (result.isRight()) {
  //     final data = (result as Right<BaseError, InitModel?>).value;
  //     print("token: ${data!.content!.token!}");
  //     sessionManager.persistToken(data.content!.token!);
  //   }
  //   return executeWithoutConvert(remoteResult: result);
  // }


}


