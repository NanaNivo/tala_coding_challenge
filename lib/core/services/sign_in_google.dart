// import 'package:dartz/dartz.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:tala_coding_challenge/core/error/custom_error.dart';
// import 'package:tala_coding_challenge/data/models/currency_model.dart';
//
// class GoogleServices
// {
//
//
//   static final  GoogleSignIn _googleSignIn = GoogleSignIn(
//   clientId: '56146347871-e3g2uo97d8m599cniql3njj49v4a5c09.apps.googleusercontent.com',
//
//   );
//
//    Future<Either<CustomError,SetUserModel>> SignInGoogle()
//   async {
//     try {
//     GoogleSignInAccount? account=  await _googleSignIn.signIn();
//
//     if(account!=null)
//       {
//      final    googleKey=await account.authentication;
//         SetUserModel setUserModel=SetUserModel(firstName:account.displayName,email: account.email,accessToken:googleKey.accessToken);
//
//         return  Right(setUserModel);
//       }
//     else
//       {
//         return Left(CustomError(message:'error in sign in '));
//       }
//
//     } catch (error) {
//       print(error);
//       return Left(CustomError(message: error.toString()));
//
//     }
//   }
//
//
//
// }