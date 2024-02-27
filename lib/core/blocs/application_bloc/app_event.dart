part of 'app_bloc.dart';

abstract class AppEvent {}

class LaunchAppEvent extends AppEvent {}

class AppLanguageEvent extends AppEvent {
  final AppLanguages languages;

  AppLanguageEvent(this.languages);
}

class AppThemeModeEvent extends AppEvent {
  final AppThemeMode? appThemeMode;

  AppThemeModeEvent({this.appThemeMode});
}

class CheckUserEvent extends AppEvent{

}

class ResetChangeCurrencyEvent extends AppEvent{

}

class SetCurrencyEvent extends AppEvent {
  final String code;

  SetCurrencyEvent(this.code);
}

class ChangeCurrencyEvent extends AppEvent {
  final String code;

  ChangeCurrencyEvent(this.code);
}
class GetCurrencyEvent extends AppEvent {

}

class ChangeCheckUserEvent extends AppEvent{
  final bool? data;
  ChangeCheckUserEvent({this.data});

}



class SetAppStatusEvent extends AppEvent {
  final AppStatus appStatus;
  final bool? isFirstTime;

  SetAppStatusEvent(this.appStatus, {this.isFirstTime});
}
class SetProfileEvent extends AppEvent
{

}
// class SetAddressEvent extends AppEvent
// {
//
// }


class CartItemsCountEvent extends AppEvent{
  final int? cartItemsCount;
  CartItemsCountEvent({required this.cartItemsCount});
}
class GetVisialSettingEvent extends AppEvent
{

}