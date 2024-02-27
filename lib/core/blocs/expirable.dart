import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/error/http/forbidden_error.dart';
import 'package:tala_coding_challenge/core/result/result.dart';

// abstract class Expirable {
//   void expire(Result result) {
//     if (result.hasErrorOnly && result.error is ForbiddenError) {
//       locator<AuthBloc>().logout();
//     }
//     return;
//   }
// }
