
import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/entity/pagination_params.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';

// class GetProductPaginationUseCase extends UseCaseWrapper<ProductModel, PaginationParams> {
//   final GetProductUseCase getSliderUseCase;
//
//    GetProductPaginationUseCase({required this.getSliderUseCase}) ;
//
//   @override
//   Future<List<ProductModel>> caller(PaginationParams params) async {
//     print('GetPublicActivities: }');
//     final response = await getSliderUseCase(ProductParms(productRequest: ProductRequest(
//         pageSize: params.limit,
//         page: params.startIndex),
//       // categoryId: params.extraParams['categoryId'],
//     ));
//     return responseChecker(response);
//   }
// }