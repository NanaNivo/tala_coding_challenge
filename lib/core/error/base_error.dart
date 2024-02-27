import 'package:equatable/equatable.dart';

abstract class BaseError extends Equatable {

}
class StringError extends BaseError
{
  final error;
  StringError({this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];

}