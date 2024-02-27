


import 'package:flutter/widgets.dart';
import 'package:tala_coding_challenge/core/error/base_error.dart';
import 'package:tala_coding_challenge/core/error/connection/net_error.dart';
import 'package:tala_coding_challenge/core/param/base_param.dart';
import 'package:tala_coding_challenge/core/result/result.dart';

import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/bloc/infinite_list_bloc.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/entity/pagination_params.dart';

import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/entity/product_wrappers.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/presentation/pagination_builder.dart';


typedef AsyncCallbackWithParams<T> = Future<T> Function(BaseParams b);
typedef BuilderType<T> = Widget Function(T data, int index);

class WrapperParams {
  final int startIndex;
  final Map<String, dynamic> extraParams;

  WrapperParams(this.startIndex, this.extraParams);

  WrapperParams copyWith({int? startIndex, Map<String, dynamic>? extraParams}) {
    return PaginationParams(
        startIndex: startIndex ?? this.startIndex, extraParams: extraParams ?? this.extraParams);
  }
}

abstract class UseCaseWrapper<T, P extends WrapperParams> {
  Future<List<T>> caller(P params);

  Future<List<T>> responseChecker(Result<BaseError, List<T>> response) async {
   // print('response.hasDataOnly: ${response.hasDataOnly}');

    if (response.hasDataOnly) {
      print('response.hasDataOnly: ${response.data}');
      return response.data??[];
    } else if (response.hasErrorOnly) {
      print("type error ${response.error is NetError }");
      throw Exception(response.error);
    }
    return [];
  }
}

extension PainationUseCaseBuilder on UseCaseWrapper {
  Widget buildPaginationList<T>({
    Map<String, dynamic>? extraParams,
    BuilderType<T>? listBuilder,
    BuilderType<T>? gridBuilder,
    EdgeInsets? padding,
    Key? builderKey,
    PaginationController<T>? controller,
    // CarouselOptions? options,
    ScrollController? scrollController,
    void Function(int id, int index, bool hasChild)? onPressed,
    int? currentId,
  }) {
    print('asdasdasdsdsadasdasdsad');
    switch (runtimeType) {
      // case GetSlidersHome:
      //   return _buildSlidersList(
      //       builderKey,
      //       extraParams??{},
      //       listBuilder as BuilderType<ItemsModel>,
      //       gridBuilder as BuilderType<ItemsModel>,
      //       controller as PaginationController<ItemsModel>,options);







      default:
        return Container();
    }
  }
}




extension Builders on UseCaseWrapper {
  // Widget _buildSlidersList(
  //     Key? builderKey,
  //     Map<String, dynamic> extraParams,
  //     BuilderType<ItemsModel> listBuilder,
  //     BuilderType<ItemsModel> gridBuilder,
  //
  //     PaginationController<ItemsModel>? controller,CarouselOptions? options,
  //    ) {
  //   return PaginationBuilder<ItemsModel>(
  //     key: builderKey,
  //     type: ListType.slider,
  //     scrollDirection: Axis.horizontal,
  //     flex: 10,
  //     controller: controller,
  //     extraParams: extraParams,
  //     useCase: this,
  //     listBuilder: listBuilder,
  //     gridBuilder: gridBuilder,
  //     options: options,
  //
  //   );
  }


