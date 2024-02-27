import 'package:tala_coding_challenge/core/helper/util/pair.dart';


// class BranchEntity {
//   int? id;
//   int? status;
//   double? latitude;
//   double? longitude;
//   String? phoneNumber;
//   int? countryId;
//   String? details;
//   List<Pair<String, String>>? daysWorkingHours;
//   String? name;
//
//   BranchEntity.fromModel(BranchModel branchModel) {
//     id = branchModel.id;
//     status = branchModel.status;
//     latitude = branchModel.latitude;
//     longitude = branchModel.longitude;
//     phoneNumber = branchModel.phoneNumber;
//     details = branchModel.detailsAsText;
//     countryId = branchModel.countryId;
//     name = branchModel.name;
//     daysWorkingHours = branchModel.daysWorkingHours
//         ?.map((key, value) => MapEntry(key, Pair(key, (value as List).first.toString())))
//         .values
//         .toList();
//   }
// }
