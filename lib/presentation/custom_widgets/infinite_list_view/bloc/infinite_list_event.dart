part of 'infinite_list_bloc.dart';

abstract class PostEvent  {
  @override
  List<Object> get props => [];
}

class DataFetched extends PostEvent {
  final Map<String, dynamic> extraParams;

  DataFetched({required this.extraParams});
  @override
  List<Object> get props => [extraParams];
}

class ResetEvent extends PostEvent {}

class ChangeListType extends PostEvent {
  final ListType listType;

  ChangeListType(this.listType);
  @override
  List<Object> get props => [listType];
}
