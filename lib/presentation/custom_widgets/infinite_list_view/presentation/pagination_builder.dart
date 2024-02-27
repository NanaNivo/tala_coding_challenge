

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/bloc/infinite_list_bloc.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/entity/pagination_params.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/presentation/widgets/error_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


import '../entity/usecase_wrapper.dart';
import 'widgets/bottom_loader.dart';

typedef PaginationType<T> = Widget Function(T data, int index);

class PaginationController<T> {
  PostsListState<T>? _state;

  void setData(PostsListState<T> state) {
    _state = state;
  }

  void getData(Map<String, dynamic> extraParams) {

    _state?.callEvent(extraParams);
  }


  void changeListType({required ListType listType}) {
    _state?.changeListType(listType: listType);
  }
  int? getLengthList()
  {
   return _state?.bloc.state.data.length;
  }

}

class PaginationBuilder<T> extends StatefulWidget {
  const PaginationBuilder({
    Key? key,
    required this.gridBuilder,
    required this.listBuilder,
    required this.useCase,
    this.withError = true,
    this.scrollDirection = Axis.vertical,
    this.extraParams = const {},
    this.controller,
    this.flex = 1,
    this.padding,
    this.callEvent,
    this.type = ListType.grid,this.options,this.scrollController
  }) : super(key: key);
  final PaginationType<T> gridBuilder;
  final PaginationType<T> listBuilder;
  final UseCaseWrapper useCase;
  final Map<String, dynamic> extraParams;
  final Axis scrollDirection;
  final bool withError;
  final ListType type;
  final int flex;
  final VoidCallback? callEvent;
  final PaginationController<T>? controller;
  final EdgeInsets? padding;
  final CarouselOptions? options;
 final ScrollController? scrollController;

  @override
  State<PaginationBuilder<T>> createState() => PostsListState<T>();
}

class PostsListState<T> extends State<PaginationBuilder<T>>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
 late AnimationController listAnimationController;
late  AnimationController gridAnimationController;
late CarouselController? carouselController;

 final InfiniteListBloc bloc=InfiniteListBloc() ;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Check if _scrollController is not null and add the listener
  //   if (_scrollController != null) {
  //     _scrollController.addListener(() {
  //       print("data Fetch${_isBottom}${enterToScrol}");
  //     });
  //   }
  // }
  @override
  void initState() {
     // if(widget.scrollController!=null)
     //   {
     //     print("scrol is not null");
     //     _scrollController=widget.scrollController!;
     //   }
     // else
     //   {
     //     _scrollController= ScrollController() ;
     //   }
    if (widget.controller != null) {
      widget.controller!.setData(this);
    }
    listAnimationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    gridAnimationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    bloc.buildObject(widget.useCase, PaginationParams());
    //bloc = InfiniteListBloc();
   _scrollController=  ScrollController();

    super.initState();

    _scrollController.addListener((){
      print("data Fetch");
      if (_isBottom&&enterToScrol)
      {

        bloc.add(DataFetched(extraParams: widget.extraParams));
        enterToScrol=false;
      };
    });
    changeListType(listType: widget.type);
   // print("data Fetch initState${widget.}");
  bloc.add(DataFetched(extraParams: widget.extraParams));

    carouselController=CarouselController();
  }
  bool enterToScrol=false;
  int _indexcurrent=0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InfiniteListBloc, InfiniteListState>(
      listener: (context, state) {
        if (state.isError && state.data.isNotEmpty) {
          // Scaffold.of(context).showSnackBar(SnackBar(
          //     content: Text(state.error.toString()),
          //     duration: const Duration(seconds: 2),
          //     backgroundColor: locator<AppThemeColors>().primaryColor));
        }
        else if(state.status==ListStatus.success)
          {
            enterToScrol=true;
          }
      },
      bloc: bloc,
      builder: (context, state) {
        print("Conterxtttoototooto ${state} ${state.status} ${state.data} ${state.statusError}");
        if (state.isError && state.data.isEmpty) {
          return Visibility(
              visible: widget.withError,
              child: PaginationError(error: state.error??'',typeError:state.statusError ,));
        }
        switch (state.status) {
          case ListStatus.success:
            if (state.data.isEmpty) {
              //   return Visibility(
              //       visible: widget.withError,
              //       child: const PaginationError(error: "There is no data",typeError: StatusError.no_data,));
              // }
             return SizedBox();
            }
            if (state.listType == ListType.list) {
              print(state);
              return ListView.builder(
                padding: widget.padding?? const EdgeInsets.all(0),
                shrinkWrap: true,

                scrollDirection: widget.scrollDirection,
                itemBuilder: (BuildContext context, int index) {
                  print('index index index $index  ${state.data.length}');
                  final int count =
                      state.data.length > 10 ? 10 : state.data.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: listAnimationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  listAnimationController?.forward();

                    return index >= state.data.length
                        ? const BottomLoader()
                        : AnimatedBuilder(
                          animation: listAnimationController,
                          builder: (BuildContext context, Widget? child) {
                            return FadeTransition(
                                opacity: animation,
                                child: Transform(
                                  transform: Matrix4.translationValues(
                                      100 * (1.0 - animation.value), 0.0, 0.0),
                                  child: widget.listBuilder(
                                      (state.data[index]), index),
                                ));
                          });
                },
                itemCount: state.hasReachedMax
                    ? state.data.length
                    : state.data.length + 1,
                controller: _scrollController,
              );
            }
            else if(state.listType==ListType.slider)
              {
                return Stack(
                  children: [
                    CarouselSlider.builder(
                        itemCount: state.data.length,
                        itemBuilder:(context,index,realindex){
                          _indexcurrent=index;
                    print('index index index $index  ${state.data.length}');
                        final int count =
                        state.data.length > 10 ? 10 : state.data.length;
                        final Animation<double> animation =
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: listAnimationController,
                            curve: Interval((1 / count) * index, 1.0,
                                curve: Curves.fastOutSlowIn)));
                    listAnimationController?.forward();

                    return index >= state.data.length
                        ? const BottomLoader()
                        : AnimatedBuilder(
                        animation: listAnimationController,
                        builder: (BuildContext context, Widget? child) {
                          return FadeTransition(
                              opacity: animation,
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    100 * (1.0 - animation.value), 0.0, 0.0),
                                child: widget.listBuilder(
                                    (state.data[index]), index),
                              ));
                        }); },
                        carouselController: carouselController,
                        options: widget.options!),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: DotsIndicator(
                        dotsCount: state.data.length,
                        position: _indexcurrent,
                        axis: Axis.horizontal,
                      ),
                    ),
                  ],
                );
              }
            return GridView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: state.hasReachedMax
                  ? state.data.length
                  : state.data.length + 1,
              controller:widget.scrollController?? _scrollController,
              //if scrolController passed no Physic scroller and no fetch pagination Data
              physics:widget.scrollController!=null? NeverScrollableScrollPhysics():ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                print("index == state.data.length${index == state.data.length}");
                final int count =
                state.data.length > 10 ? 10 : state.data.length;
                final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: gridAnimationController,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                gridAnimationController?.forward();
                return widget.scrollController!=null&&index == state.data.length?
                    SizedBox():
                index == state.data.length
                    ? const BottomLoader()
                    :  AnimatedBuilder(
                    animation: gridAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return FadeTransition(
                          opacity: animation,
                          child: Transform(
                            transform: Matrix4.translationValues(
                                100 * (1.0 - animation.value), 0.0, 0.0),
                            child: widget.gridBuilder(
                                (state.data[index]), index),
                          ));
                    });
              },
            );
          case ListStatus.initial:
            return Visibility(
              visible: widget.withError,
              child: Center(
                  child: LoadingAnimationWidget.threeRotatingDots(
                      color: locator<AppThemeColors>().primaryColor, size: 50)),
            );
          default:
            return Visibility(visible: false, child: Container());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    gridAnimationController?.dispose();
    listAnimationController?.dispose();
    super.dispose();
  }

  void _onScroll() {

    if (_isBottom&&enterToScrol)
      {
        print("data Fetch");
        bloc.add(DataFetched(extraParams: widget.extraParams));
        enterToScrol=false;
      };

  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void callEvent(Map<String, dynamic> extraParams) {
    print("data fetch${extraParams}");
    bloc.add(ResetEvent());
    bloc.add(DataFetched(extraParams: extraParams));
  }

  void changeListType({required ListType listType}) {
   gridAnimationController?.reverse();
   listAnimationController?.reverse();
    bloc.add(ChangeListType(listType));
  }
}
