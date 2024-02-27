part of 'infinite_list_bloc.dart';

enum ListStatus { initial, success, failure, errorWithData }

enum ListType { grid, list ,slider}

enum StatusError {unset,no_data,no_enternet,soon}

class InfiniteListState<T> extends Equatable {
  const InfiniteListState(
      {this.status = ListStatus.initial,
      this.data = const [],
      this.hasReachedMax = false,
      this.currentPage = 1,
      this.limit=10,
      this.listType = ListType.grid,
      this.isError = false,
      this.error,this.statusError=StatusError.unset});

  final ListStatus status;
  final List<dynamic> data;
  final bool hasReachedMax;
  final int currentPage;
  final int limit;
  final String? error;
  final bool isError;
  final ListType listType;
  final StatusError statusError;

  InfiniteListState<T> copyWith(
      {ListStatus? status,
      List<dynamic>? data,
      bool? hasReachedMax,
      int ?currentPage,
      int? limit,
      ListType? listType,
      bool? isError,
      Map<String, dynamic>? currentParams,
      String? error,StatusError? statusError}) {
    return InfiniteListState<T>(
        status: status ?? this.status,
        data: data ?? this.data,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        currentPage: currentPage ?? this.currentPage,
        limit: limit ?? this.limit,
        isError: isError ?? this.isError,
        listType: listType ?? this.listType,
        error: error ?? this.error,statusError: statusError??this.statusError);
  }

  @override
  List<Object?> get props => [
    statusError,
        status,
        data,
        hasReachedMax,
        currentPage,
        limit,
        error,
        isError,
        listType
      ];
}
