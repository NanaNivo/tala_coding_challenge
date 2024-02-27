import 'package:dartz/dartz.dart';
import 'package:tala_coding_challenge/core/datasources/api_call_params.dart';
import 'package:tala_coding_challenge/core/datasources/function_instance.dart';
import 'package:tala_coding_challenge/core/enums/api/HttpMethod.dart';
import 'package:tala_coding_challenge/core/resources/apis.dart';

import 'package:tala_coding_challenge/data/responses/auth_response.dart';

import '../../../core/error/base_error.dart';

import '../../requests/auth_request.dart';
import '../../responses/exchange_response.dart';
import 'auth_data_source.dart';

class AuthDataSourceImpl extends AuthDataSource {
  // @override
  // Future<Either<BaseError, InitModel>> setMobileId(SetMobileIdRequest setMobileIdRequest) {
  //   return request<InitModel, SetMobileIdResponse>(ApiCallParams<SetMobileIdResponse>(
  //       responseStr: "SetMobileIdResponse",
  //       mapper: (json) => SetMobileIdResponse.fromJson(json),
  //       data: setMobileIdRequest.toJson(),
  //       method: HttpMethod.POST,
  //       url: ApiUrls.setAppInfo));
  // }



}
