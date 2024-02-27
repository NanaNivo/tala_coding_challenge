import 'package:flutter/material.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';

import 'base_param.dart';

class NoParams extends BaseParams {}

class IntParams extends BaseParams {
  final int? data;

  const IntParams(this.data);
}

class StringParams extends BaseParams {
  final String? data;

  const StringParams(this.data);
}

class ProductsRequestParams extends BaseParams {
  final int? type_id;
  final int? category;

  const ProductsRequestParams({this.type_id, this.category});
}

class DetailedProductParams extends BaseParams {
  final int id;

  const DetailedProductParams({required this.id});
}
class SubscribeSizeParams extends BaseParams{
  final String? colorSizeId;
  final String? email;

  SubscribeSizeParams(this.colorSizeId, this.email);
}

