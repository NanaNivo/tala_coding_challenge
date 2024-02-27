import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:tala_coding_challenge/app+injection/app.dart';
import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/blocs/application_bloc/app_bloc.dart';
import 'package:tala_coding_challenge/core/navigation/routes.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:tala_coding_challenge/core/resources/constants.dart';
import 'package:tala_coding_challenge/presentation/flows/root_flow/bloc/root_cubit.dart';
import 'package:tala_coding_challenge/presentation/flows/root_flow/widget/primary_button.dart';





class NavigationController {
  final List<NavigationItem> navigationItems = [
    NavigationItem(
      title: 'home',
      enabledIcon: ImagesKeys.home,
      disabledIcon: ImagesKeys.home,
      page: Container(),
    ),
    NavigationItem(
      title: 'category',
      enabledIcon: ImagesKeys.category2,
      disabledIcon: ImagesKeys.category2,
      page: Container(),
    ),
    NavigationItem(
      title: 'cart',
      enabledIcon: ImagesKeys.cart,
      disabledIcon: ImagesKeys.cart,
      page: Container(),
    ),
    NavigationItem(
      title: 'user',
      enabledIcon: ImagesKeys.user,
      disabledIcon: ImagesKeys.user,
      page: Container(),
    ),

  ];

  int _currentIndex = 0;

  NavigationItem get currentNavigationItem => navigationItems[_currentIndex];

  int get currentIndex => _currentIndex;

  List<BottomNavigationBarItem> get bottomNavigationBarItems =>
      navigationItems
          .map((item) =>
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 5.h),
                  child: Container(
                    //width: 300,
                  height: 30.h,
                 //  decoration: BoxDecoration(
                 //      image:DecorationImage(
                 //          image: AssetImage(item.disabledIcon,),
                 //          fit:BoxFit.contain
                 //      )
                 // // child: Image.asset(  item.disabledIcon,width: 70.w,color:Colors.white ,height: 80.h,
                 //    ),
                    child: SvgPicture.asset(item.disabledIcon,width: 30.w),
                  ),
                ),
                Text(
               item.title,
                  style: TextStyle(color: locator<AppThemeColors>().white,fontSize: 20.sp,overflow:TextOverflow.fade ),
                )
              ],
            ),
            activeIcon: Column(
              children: [
                Container(
                  // color: Colors.red,
                  padding: EdgeInsetsDirectional.only(top: 6.h),
                 // width: 180.w,
                  height: 30.h,
                  // decoration: BoxDecoration(
                  //   image:DecorationImage(
                  //     image: AssetImage(item.enabledIcon)
                  //   )
                  //
                  // ),
                  child: SvgPicture.asset(item.enabledIcon,color: locator<AppThemeColors>().dark,width: 30.w,),
                ),
                Text(
                  item.title,
                  style: TextStyle(color: locator<AppThemeColors>().white,fontSize: 20.sp,fontWeight: FontWeight.bold),
                )
              ],
            ),
            label: '',

          ))
          .toList();

  Widget get currentPage => currentNavigationItem.page;

  void navigateToPage(int index) {
    _currentIndex = index;
  }
}

class NavigationItem {
  final String title;
  final String enabledIcon;
  final String disabledIcon;
  final Widget page;

  NavigationItem({required this.title,
    required this.enabledIcon,
    required this.disabledIcon,
    required this.page});
}


class RootPageWidget extends StatefulWidget {
  RootPageWidget({required this.navigationShell, required this.index});

  final Widget navigationShell;
  int index;

  @override
  // ignore: library_private_types_in_public_api
  _RootPageWidgetState createState() => _RootPageWidgetState();
}

class _RootPageWidgetState extends State<RootPageWidget> {
  //final bloc = locator<AppBloc>();
  final NavigationController navigationController = NavigationController();

  final bloc = locator<RootCubit>();
  final appBloc = locator<AppBloc>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // bloc.navigate(0);
  }

  @override
  Widget build(BuildContext context) {
    print("index${widget.index}${bloc.state.currentIndex}");
    return BlocConsumer<RootCubit, RootState>(
      bloc: bloc,
      listener: (context, state) {


      },
      builder: (context, state) {

        return Scaffold(
          body: widget.navigationShell,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: locator<AppThemeColors>().primaryColor,
            ),
            child: BottomNavigationBar(
              selectedFontSize: 0,
              unselectedFontSize: 0,
              //  type: BottomNavigationBarType.shifting,
              items: navigationController.bottomNavigationBarItems,
              //  iconSize: 24,
              currentIndex: bloc.state.currentIndex,
              onTap: (index) {
                bloc.navigate(index);
                //  navigationController.navigateToPage(index);
                print("index 3 navigate button${index}");
                if (index == 0) {
                  context.go(RoutesPath.rootPage, extra: {'index': 0});
                } else if (index == 1) {
                //  context.go(RoutesPath.sevices, extra: {'index': 1});
               //   context.go(RoutesPath.category, extra: {'index': 1});
                } else if (index == 2) {
                  context.go(RoutesPath.cartPage, extra: {'index': 2});
                } else if (index == 3) {
                  context.go(RoutesPath.userPage, extra: {'index': 3});
                } else if (index == 4) {

                }
              },
            ),
          ),
        );
      },
    );


  }

}



