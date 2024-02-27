// import 'package:dartz/dartz.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:tala_coding_challenge/core/error/custom_error.dart';
// import 'package:tala_coding_challenge/data/models/currency_model.dart';
//
// class LogInWithFacebook
// {
//
//  Future<Either<CustomError,String>> login()
//   async {
//     try {
//       Map<String, dynamic> resultTemp = {};
//       // await FacebookAuth.instance.logOut();
//       final LoginResult result = await FacebookAuth.instance.login(
//           permissions: ['public_profile']);
//       print("status in facebook${result.status}");
//       if (result.status == LoginStatus.success) {
//         // you are logged
//         final AccessToken accessToken = result.accessToken!;
//
//         resultTemp['token'] = accessToken.token;
//         resultTemp['massage'] = null;
//         FacebookPermissions? permissions = await FacebookAuth.instance
//             .permissions;
//         print("permision ${permissions?.granted}");
//
//         return Right(accessToken.token);
//       } else {
//         print(result.status);
//         print(result.message);
//         resultTemp['token'] = null;
//         resultTemp['massage'] = result.message;
//         return Left(CustomError(message: result.message.toString()));
//       }
//     }catch(error)
//     {
//       return Left(CustomError(message: error.toString()));
//     }
//
//   }
// }