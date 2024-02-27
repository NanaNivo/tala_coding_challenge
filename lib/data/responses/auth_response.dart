import 'package:tala_coding_challenge/core/response/api_response.dart';


// class RegisterResponse extends ApiResponse<InitModel?> {
//   RegisterResponse(
//       String msg,
//       bool hasError,
//       InitModel? result,
//       ) : super(msg, hasError, result);
//
//   factory RegisterResponse.fromJson(json) {
//     String message = '';
//     bool isSuccess = json['result'] == 'success';
//     InitModel? model;
//     if (isSuccess) {
//       model = InitModel.fromJson(json);
//     } else {
//
//       message =json['error_des'];
//     }
//
//     return RegisterResponse(message, !isSuccess, model);
//   }
// }

