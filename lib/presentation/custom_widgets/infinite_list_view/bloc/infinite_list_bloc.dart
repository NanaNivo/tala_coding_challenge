import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:collection/collection.dart';

import 'package:equatable/equatable.dart';
import 'package:tala_coding_challenge/core/error/connection/net_error.dart';
import 'package:tala_coding_challenge/core/error/http/forbidden_error.dart';
import 'package:tala_coding_challenge/core/param/base_param.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/entity/pagination_params.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';

import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
part 'infinite_list_event.dart';

part 'infinite_list_state.dart';

typedef AsyncCallbackWithParams<T, P extends BaseParams> = Future<T> Function(
    P b);

const throttleDuration = Duration(milliseconds: 200);

enum ComparingStatus { equal, larger, smaller }

class InfiniteListBloc<T> extends Bloc<PostEvent, InfiniteListState<T>> {
 late UseCaseWrapper useCaseWrapper;
  late WrapperParams wrapperParams;

  InfiniteListBloc() : super(const InfiniteListState()) {
    on<DataFetched>(
      _onDataFetched,
  transformer: throttleDroppable(throttleDuration),
    );
    on<ResetEvent>(
      _onReset,
     transformer: throttleDroppable(throttleDuration),
    );
    on<ChangeListType>(_onChangeListType);
  }

  void buildObject(UseCaseWrapper useCaseWrapper, WrapperParams wrapperParams) {
    setUseCaseWrapper = useCaseWrapper;
    setWrapperParams = wrapperParams;
  }

  set setUseCaseWrapper(UseCaseWrapper useCaseWrapper) {
    this.useCaseWrapper = useCaseWrapper;
  }

  set setWrapperParams(WrapperParams wrapperParams) {
    this.wrapperParams = wrapperParams;
  }

  EventTransformer<E> throttleDroppable<E>(Duration duration) {
    return (events, mapper) {
      return droppable<E>().call(events.throttle(duration), mapper);
    };
  }

  void _onReset(ResetEvent event, Emitter<InfiniteListState<T>> emit) {
    emit(InfiniteListState<T>(listType: state.listType));
  }

  void _onChangeListType(
      ChangeListType event, Emitter<InfiniteListState<T>> emit) {
    if (event.listType == null) {
      emit(state.copyWith(
          listType:
              state.listType == ListType.list ? ListType.grid : ListType.list));
    }
    emit(state.copyWith(listType: event.listType));
  }

  Future<void> _onDataFetched(
      DataFetched event, Emitter<InfiniteListState<T>> emit) async {
    MapEquality<String, dynamic> mapEquality = MapEquality<String, dynamic>();
    if(!mapEquality.equals(wrapperParams?.extraParams, event.extraParams))
      {
        print('the same state');
     //  add(ResetEvent());
      }
    //print('wrapperParams.extraParams ${(wrapperParams as PaginationParams)?.extraParams} ${(wrapperParams as PaginationParams).limit}');
   // bool isEqual
    wrapperParams.extraParams.forEach((key, value) {
        if(value!=event.extraParams[key]);
        {
          print('the dont same');
        }
    });

   bool isEqual= mapEquality.equals(wrapperParams?.extraParams, event.extraParams);
    final WrapperParams params = wrapperParams.copyWith(
        startIndex: state.currentPage, extraParams: event.extraParams);
   // wrapperParams=params;
    if (state.hasReachedMax) return;
    try {
     // print('state111111111111: ${state.data}${  useCaseWrapper.caller(params)}');

      final  data = await this.useCaseWrapper.caller(params);
      print("useCase Wrapper${data}");
      //print('compare(data): ${compare(data)}${isEqual}');
      if (compare(data) == ComparingStatus.equal) {
        emit(state.copyWith(
          status: ListStatus.success,
          isError: false,
          currentPage: state.currentPage + 1,
        //  data:mapEquality.equals(wrapperParams.extraParams, event.extraParams)?(data as List<T>):List.of(state.data)..addAll(data as List<T>),
          data: List.of(state.data)..addAll(data as List<T>),
          hasReachedMax: false,
        ));
        print('state222222222222: success $state');
        return;
      }

      emit(state.copyWith(
          hasReachedMax: true,
          status: compare(data) == ComparingStatus.smaller
              ? ListStatus.success
              : state.status,
          isError:
              compare(data) == ComparingStatus.smaller ? false : state.isError,
          data: compare(data) == ComparingStatus.smaller? (List.of(state.data)..addAll(data as List<T>))
              : state.data, ));
      print('state333333333333: $state equal Map  ${wrapperParams.extraParams} ${event.extraParams}');
    } on ForbiddenError catch (e) {
      throw ForbiddenError();
    } catch (e, stacktrace) {
      print('ee: $e $stacktrace ${e.hashCode} ${e is  NetError}');
      emit(state.copyWith(isError: true, error: e.toString(),statusError: (e is  NetError)?StatusError.no_enternet:StatusError.soon));
    }
  }

  ComparingStatus? compare(List<dynamic>? data) {
    final length = data?.length??0;
    final limit = (wrapperParams as PaginationParams).limit;
    if (length == limit) return ComparingStatus.equal;
    if (length < limit) return ComparingStatus.smaller;
    if (length > limit) return ComparingStatus.larger;
  }
}
