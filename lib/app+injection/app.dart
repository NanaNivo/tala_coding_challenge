import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/blocs/application_bloc/app_bloc.dart';
import 'package:tala_coding_challenge/core/localization/app_lang.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:tala_coding_challenge/core/resources/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../core/navigation/routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppBloc appBloc = locator<AppBloc>();

  @override
  void initState() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    super.initState();
    appBloc.add(LaunchAppEvent());

  }

  @override
  void dispose() {
    appBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => appBloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (locator.isRegistered<AppThemeColors>()) {
            locator.unregister<AppThemeColors>();
          }
          locator.registerFactory<AppThemeColors>(
              () => ThemeFactory.colorModeFactory(state.appThemeMode));

          return ScreenUtilInit(
              designSize: const Size(414, 896),
              ensureScreenSize:true,
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return DynamicColorBuilder(
                    builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                      builder: (context, child) => ResponsiveBreakpoints.builder(
                    breakpoints: [
                      const Breakpoint(start: 0, end: 450, name: MOBILE),
                      const Breakpoint(start: 451, end: 800, name: TABLET),
                      const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                      const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                    ],child: child!),
                    title: 'coding',
                    theme: AppTheme.appThemeData(
                        locator<AppThemeColors>(), state.isEnglish, Brightness.light, lightDynamic),
                    darkTheme: AppTheme.appThemeData(
                        locator<AppThemeColors>(), state.isEnglish, Brightness.dark, darkDynamic),
                    themeMode: ThemeFactory.currentTheme(state.appThemeMode),
                    locale: LocalizationManager.localeFactory(state.language),
                    localizationsDelegates: LocalizationManager.createLocalizationsDelegates,
                    supportedLocales: LocalizationManager.createSupportedLocals,
                    routerConfig: router,
                  );
                });
              });
        },
      ),
    );
  }
}
