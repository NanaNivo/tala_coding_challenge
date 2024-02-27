import 'package:dartz/dartz.dart';
import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/error/base_error.dart';
import 'package:tala_coding_challenge/core/param/base_param.dart';
import 'package:tala_coding_challenge/core/param/no_param.dart';
import 'package:tala_coding_challenge/core/result/result.dart';
import 'package:tala_coding_challenge/core/services/login_with_facebook.dart';
import 'package:tala_coding_challenge/core/services/sign_in_google.dart';
import 'package:tala_coding_challenge/core/usecases/base_use_case.dart';

import '../../core/services/device_info_service.dart';

import '../../data/requests/auth_request.dart';
import '../repositories/exchange_repository.dart';

// class SetDeviceInfoUseCase extends UseCase<Future<Result<BaseError, InitModel>>, NoParams> {
//   final AuthRepository authRepository;
//   final DeviceInfoService deviceInfoService;
//
//   SetDeviceInfoUseCase(this.authRepository, this.deviceInfoService);
//
//   @override
//   Future<Result<BaseError, InitModel>> call(NoParams params) async {
//     final String uniqueId = await deviceInfoService.getUniqueId();
//     return authRepository.setMobileId(SetMobileIdRequest(uniqueId));
//   }
// }


