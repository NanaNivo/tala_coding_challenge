// import 'package:dartz/dartz.dart';
// import 'package:tala_coding_challenge/core/error/base_error.dart';
// import 'package:tala_coding_challenge/core/error/custom_error.dart';
// import 'package:tala_coding_challenge/core/resources/constants.dart';
// import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
// import 'dart:developer';
//
// class MyFatorahService {
//   static final MyFatorahService _instance = MyFatorahService._internal();
//
//   MyFatorahService._internal();
//
//   factory MyFatorahService() {
//     return _instance;
//   }
//
//   Future<Either<BaseError, MFInitiatePaymentResponse>> initiatePayment(
//       {required String currencyIso}) async {
//     try {
//       MFSDK.init(TokenKeys.tokenMyFatora, MFCountry.KUWAIT, MFEnvironment.TEST);
//       MFInitiatePaymentRequest request =
//           MFInitiatePaymentRequest(currencyIso:  currencyIso,);
//
//       MFInitiatePaymentResponse temp =
//           await MFSDK.initiatePayment(request, MFLanguage.ENGLISH);
//       return right(temp);
//     } catch (e) {
//       return Left(CustomError(message: e.toString()));
//     }
//   }
//
//   Future<Either<BaseError, int>?> executePayment(
//       {required int paymentMethodIdTemp, required double invoiceValue,required String orderId}) async {
//     try {
//
//       MFExecutePaymentRequest request =
//           MFExecutePaymentRequest(invoiceValue: invoiceValue);
//       request.paymentMethodId = paymentMethodIdTemp;
//       request.customerReference=orderId;
//
//    final MFGetPaymentStatusResponse res=   await MFSDK.executePayment(request, MFLanguage.ENGLISH, (invoiceId) {
//       //  return right(invoiceId);
//       //   submit(invoiceId);
//       //   print("inv pre ${invoiceId}");
//       });
//       print("my fatora ${res.invoiceValue}");
//       return right(res.invoiceId!);
//     } catch (e) {
//       print("e in error${e}");
//       return Left(CustomError(message: e.toString()));
//     }
//   }
// }
