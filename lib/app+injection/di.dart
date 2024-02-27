import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tala_coding_challenge/core/api/auth_interceptor.dart';
import 'package:tala_coding_challenge/core/blocs/application_bloc/app_bloc.dart';
import 'package:tala_coding_challenge/core/mediators/bloc_hub/concrete_hub.dart';
import 'package:tala_coding_challenge/core/mediators/bloc_hub/hub.dart';
import 'package:tala_coding_challenge/core/mediators/bloc_hub/members_key.dart';
import 'package:tala_coding_challenge/core/services/init_app_store.dart';
import 'package:tala_coding_challenge/core/services/session_manager.dart';
import 'package:tala_coding_challenge/core/services/theme_store.dart';
import 'package:tala_coding_challenge/core/usecases/app_theme_usecases.dart';
import 'package:tala_coding_challenge/core/usecases/check_first_initialize_usecase.dart';


import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/bloc/infinite_list_bloc.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/entity/product_wrappers.dart';
import 'package:tala_coding_challenge/presentation/fa%C3%A7ades/app_facade.dart';
import 'package:tala_coding_challenge/presentation/flows/auth_flow/bloc/auth_bloc.dart';

import 'package:tala_coding_challenge/presentation/flows/root_flow/bloc/root_cubit.dart';


final locator = GetIt.instance;

Future<void> setUpLocator() async {

  locator.registerLazySingleton<BlocHub>(() => ConcreteHub());
  locator.registerLazySingleton<ThemeStore>(() => ThemeStore());

  locator.registerLazySingleton<InitAppStore>(() => InitAppStore());
  locator.registerLazySingleton<SetAppThemeUseCase>(
      () => SetAppThemeUseCase(locator<ThemeStore>()));



  locator.registerLazySingleton<GetAppThemeUseCase>(
      () => GetAppThemeUseCase(locator<ThemeStore>()));

  locator.registerLazySingleton<CheckFirstInitUseCase>(
      () => CheckFirstInitUseCase(locator<InitAppStore>()));




  locator.registerLazySingleton<SetFirstTimeUseCase>(
      () => SetFirstTimeUseCase(locator<InitAppStore>()));

  locator.registerLazySingleton<DefaultSessionManager>(
      () => DefaultSessionManager());
  locator.registerFactory<Dio>(() => Dio());

  locator.registerLazySingleton<AuthInterceptor>(
          () => AuthInterceptor(locator<DefaultSessionManager>(), locator<Dio>()));

  locator.registerLazySingleton(() => RootCubit());

  locator.registerLazySingleton(() => AuthBloc());


  locator.registerLazySingleton<AppUiFacade>(() => AppUiFacade(
    setAppThemeUseCase: locator<SetAppThemeUseCase>(),
    getAppThemeUseCase: locator<GetAppThemeUseCase>(),
    checkFirstInitUseCase: locator<CheckFirstInitUseCase>(),
    setFirstTimeUseCase: locator<SetFirstTimeUseCase>(),

  ));

  //locator.registerLazySingleton(() => InfiniteListBloc());

  locator.registerLazySingleton<AppBloc>(
          () => AppBloc(appUiFacade: locator<AppUiFacade>()));


  locator<BlocHub>().registerByName(locator<AppBloc>(), MembersKeys.appBloc);






}
