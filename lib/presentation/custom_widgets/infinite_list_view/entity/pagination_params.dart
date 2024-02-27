import 'dart:convert';

import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';


class PaginationParams extends WrapperParams {
  final int limit;

  PaginationParams(
      {int startIndex = 0,
      this.limit = 10,
      Map<String, dynamic> extraParams = const {}})
      : super(startIndex, extraParams);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is WrapperParams &&
              runtimeType == other.runtimeType &&
              startIndex == other.startIndex &&
              jsonEncode(extraParams) == jsonEncode(other.extraParams);

  @override
  int get hashCode => startIndex.hashCode ^ jsonEncode(extraParams).hashCode;

  @override
  PaginationParams copyWith(
      {int? startIndex, Map<String, dynamic>? extraParams}) {
    return PaginationParams(
        startIndex: startIndex ?? this.startIndex,
        limit: limit,
        extraParams: extraParams ?? this.extraParams);
  }
}

// class ProductPaginationParams extends PaginationParams {
//   final int categoryId;
//
//   ProductPaginationParams(
//       {int startIndex = 0, this.categoryId = 1, int limit = 10})
//       : super(limit: limit, startIndex: startIndex);
//
//   @override
//   PaginationParams copyWith({int startIndex, int categoryId}) {
//     return ProductPaginationParams(
//         startIndex: startIndex ?? this.startIndex,
//         limit: limit,
//         categoryId: categoryId ?? this.categoryId);
//   }
// }
