import 'dart:async';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/helper/extensions/color_converter_extension.dart';
import 'package:tala_coding_challenge/core/mediators/bloc_hub/hub.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tala_coding_challenge/core/localization/app_lang.dart';
import 'package:tala_coding_challenge/core/mediators/bloc_hub/bloc_member.dart';
import 'package:tala_coding_challenge/core/mediators/bloc_hub/members_key.dart';
import 'package:tala_coding_challenge/core/mediators/communication_types/AppStatus.dart';
import 'package:tala_coding_challenge/core/mediators/communication_types/base_communication.dart';
import 'package:tala_coding_challenge/core/mediators/communication_types/bool_type.dart';
import 'package:tala_coding_challenge/core/param/no_param.dart';
import 'package:tala_coding_challenge/core/resources/apis.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';

import 'package:tala_coding_challenge/presentation/fa%C3%A7ades/app_facade.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> with BlocMember {
  final AppUiFacade appUiFacade;

  // final countryUseCase = locator<CountryUseCase>();
  // final townUseCase = locator<TownUseCase>();
  // final areaUseCase = locator<AreaUseCase>();

  AppBloc({
    required this.appUiFacade,
  }) : super(const AppState()) {
    /// App Events
    on<LaunchAppEvent>(_onLaunchApp);
    on<AppLanguageEvent>(_onAppLanguage);
    on<AppThemeModeEvent>(_onAppThemeMode);
    on<SetAppStatusEvent>(_onAppStatusChanged);
    // on<SetCurrencyEvent>(_onSetCurrency);
    // on<ChangeCurrencyEvent>(_onChangeCurrency);
    on<ResetChangeCurrencyEvent>(_onResetChangeCurrency);

    //  on<SetAddressEvent>(_onSetAddress);
  }

  @override
  void receive(String from, CommunicationType data) {
    print("message Received $data");

    switch (data.runtimeType) {
      case AppStatus:
        print("in AppStatussss");
        setAppStatus(data as AppStatus);
        break;
      case BoolComType:
        add(ChangeCheckUserEvent(data: (data as BoolComType).data));
      // case InitModel:
      //   emit(state.copyWith(initModel: (data as InitModel)));
        break;
      // case CartDataConnection:
      //   add(CartItemsCountEvent(cartItemsCount: (data as CartDataConnection).cartItemsCount));
    }
  }
}

extension AppBlocMappers on AppBloc {
  // void _onCheckUser(CheckUserEvent event, Emitter<AppState> emit) async {
  //   if (state.appStatus == Status.authorized) {
  //   //  final checkProfileResult = await appUiFacade.checkUserProfile();
  //
  //     // if (checkProfileResult.hasDataOnly) {
  //     //   final resultData = checkProfileResult.data;
  //     //   emit(state.copyWith(checkProfile: resultData));
  //     // } else if (checkProfileResult.hasErrorOnly) {
  //     //   /// TODO: IMPLEMENT ERROR SNACK BAR TO SHOW ERROR
  //     //   /// emit(state.copyWith());
  //     // }
  //   } else {
  //     emit(state.copyWith(checkProfile: false));
  //   }
  // }

  void _onLaunchApp(LaunchAppEvent event, Emitter<AppState> emit) async {
    final appTheme = await appUiFacade.getAppTheme();
    final isFirstTime = await appUiFacade.isItFirstInit();

    if (isFirstTime) {
      appUiFacade.setFirstTime();
    }

    final appStatus = await appUiFacade.checkLoginStatus();
    print('result1${appStatus.name}');
    //final result = await appUiFacade.setMobileId();
    // print('result2, ${result}');

    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(
      isLaunched: true,
      appThemeMode: appTheme,
      appStatus:  appStatus,
    ));
  }

  void _onAppStatusChanged(SetAppStatusEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(
        appStatus: event.appStatus.data, isFirstTime: event.isFirstTime));
  }


  void _onAppLanguage(AppLanguageEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(language: event.languages));
  }

  void _onResetChangeCurrency(
      ResetChangeCurrencyEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(changeStatus: PageStatus.init));
  }

  void _onAppThemeMode(AppThemeModeEvent event, Emitter<AppState> emit) async {
    AppThemeMode appThemeMode = _getContraryTheme(state.appThemeMode);
    emit(state.copyWith(appThemeMode: event.appThemeMode ?? appThemeMode));
    await appUiFacade.setAppTheme(event.appThemeMode ?? appThemeMode);
  }

  AppThemeMode _getContraryTheme(AppThemeMode currentMode) {
    return currentMode == AppThemeMode.dark
        ? AppThemeMode.light
        : AppThemeMode.dark;
  }







}

extension AppBLocActions on AppBloc {
  void changeLanguage(AppLanguages languages) {
    add(AppLanguageEvent(languages));
  }

  void changeTheme({AppThemeMode? appThemeMode}) {
    add(AppThemeModeEvent(appThemeMode: appThemeMode));
  }

  void setAppStatus(AppStatus appStatus, {bool? isFirstTime}) {
    add(SetAppStatusEvent(appStatus, isFirstTime: isFirstTime));
  }

  void setCurrency(String code) {
    add(SetCurrencyEvent(code));
  }

  void changeCurrency(String code) {
    add(ChangeCurrencyEvent(code));
  }

  void getCurrency() {
    add(GetCurrencyEvent());
  }

  void addItemsCount(int count) {
    add(CartItemsCountEvent(cartItemsCount: count));
  }

  void resetChangeCurrencyStatus() {
    add(ResetChangeCurrencyEvent());
    // void setAddress() {
    //   add(SetAddressEvent());
    // }
  }
}

extension Version on String {
  int toExtendedVersionNumber() {
    List versionCells = split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  }
}
