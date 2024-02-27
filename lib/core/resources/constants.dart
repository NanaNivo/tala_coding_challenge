import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/helper/extensions/material_color_converter.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TranslationsKeys {
  static String get changeLanguage => "change_lang";

  static String get changeTheme => "change_theme";

  static String get categories => "categories";

  static String get welcome => "welcome";

  static String get purpose => "purpose";

  static String get signIn => "signIn";

  static String get signUp => "signUp";

  static String get rightClothes => "right_clothes";

  static String get seeexchange => "see_exchange";

  static String get addLocation => "add_location";

  static String get useSearchBar => "use_search_bar";

  static String get cancel => "cancel";

  static String get findLocations => "find_locations";

  static String get myLocation => "my_location";

  static String get settings => "settings";

  static String get english => "english";

  static String get arabic => "arabic";

  static String get light => "light";

  static String get dark => "dark";

  static String get degree => "degree";

  static String get wind => "Wind";

  static String get pressure => "Pressure";

  static String get showDetails => "showDetails";

  static String get exchange => "exchange";

  static String get current => "current";
}
class TokenKeys
{
 // static String get tokenMyFatora =>'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';
  static String get tokenMyFatora =>'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';
}

class ImagesKeys {
  static String get welcomeBackground => "lib/assets/welcomBg.png";

  static String get logo => "lib/assets/images/svg/logo.svg";

  static String get splashLogo => "lib/assets/images/logo.svg";
  static String get pngLogo => "lib/assets/images/png/splashscreen.png";
  static String get placeholder => "lib/assets/images/png/Placeholder.png";

  static String get sheenLogo => "lib/assets/images/png/SheenValueLogo.png";
  static String get facebook => "lib/assets/images/svg/Contact/fb.svg";
  static String get google => "lib/assets/images/svg/auth/google.svg";

  static String get rain => "lib/assets/images/svg/ph_currency-circle-dollar-thin (1).svg";

  static String get home => "lib/assets/images/svg/Tabs/home.svg";

  static String get cart => "lib/assets/images/svg/cart.svg";

  static String get category => "lib/assets/images/svg/Tabs/search.svg";

  static String get wishlist => "lib/assets/images/svg/Tabs/heart.svg";

  static String get bag => "lib/assets/images/svg/Tabs/bag.svg";

  static String get user => "lib/assets/images/svg/Tabs/user.svg";
  static String get filter => "lib/assets/images/svg/filters.svg";
  static String get list => "lib/assets/images/svg/list.svg";
  static String get grid => "lib/assets/images/svg/grid.svg";
  static String get hidePassword => "lib/assets/images/svg/auth/hide-password.svg";
  static String get showPassword => "lib/assets/images/svg/auth/show-password.svg";

  static String get info => "lib/assets/images/png/info.png";
  static String get cover => "lib/assets/images/png/cover.png";
  static String get orders => "lib/assets/images/svg/Profile/sent.svg";
  static String get notification => "lib/assets/images/svg/Profile/alarm.svg";
  static String get store => "lib/assets/images/svg/Profile/store.svg";
  static String get language => "lib/assets/images/svg/Profile/earth.svg";
  static String get currency => "lib/assets/images/svg/Profile/currency.svg";
  static String get privacy => "lib/assets/images/svg/Profile/privacy.svg";
  static String get refund => "lib/assets/images/svg/Profile/refund.svg";
  static String get about => "lib/assets/images/svg/Profile/about.svg";
  static String get category2 =>"lib/assets/images/svg/category.svg";

  static String get rain2 => "lib/assets/images/svg/Group (1).svg";

  static String get rain3 => "lib/assets/images/svg/Group.svg";

  static String get search => "lib/assets/images/svg/ei_search.svg";

  static String get phoneCall => "lib/assets/images/svg/eva_phone-call-fill.svg";

  static String get flag => "lib/assets/images/svg/flag.svg";

  static String get downArrow => "lib/assets/images/svg/dashicons_arrow-right-alt2.svg";

  static String get switcher => "lib/assets/images/svg/switcher.svg";
  static String get shipping => "lib/assets/images/svg/shipping.svg";

  static String get whatsapp => "lib/assets/images/svg/Contact/whatsapp.svg";
  static String get email => "lib/assets/images/svg/Contact/email.svg";
  static String get fb => "lib/assets/images/svg/facebook1.svg";
  static String get instagram => "lib/assets/images/svg/instagram1.svg";
  static String get youtube=>"lib/assets/images/svg/youtube1.svg";





  static String get bigLogo => "lib/assets/images/logo_my_change_big.png";

  static String get smallLogo => "lib/assets/images/logo_my_change_small.png";
}

class AppTheme {
  static ThemeData appThemeData(AppThemeColors appThemeColors, bool localeEn, Brightness brightness,
      ColorScheme? colorScheme) {
    return ThemeData(

      colorScheme: colorScheme ??

          ColorScheme.fromSwatch(
            backgroundColor: appThemeColors.backgroundColor,
            brightness: brightness,
            primarySwatch: locator<AppThemeColors>().primaryColor.toMaterialColor()
          ),
      scaffoldBackgroundColor: appThemeColors.backgroundColor,
      dialogBackgroundColor:appThemeColors.light ,
      primaryColor: appThemeColors.primaryColor,
      iconTheme: IconThemeData(
        color: appThemeColors.primaryColor,
        size: 18.sp,
      ),


      dividerTheme: DividerThemeData(color: appThemeColors.divider, thickness: 0.8),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: appThemeColors.primaryColor),
      textTheme: appTextTheme(appThemeColors.darkGray),
      progressIndicatorTheme: ProgressIndicatorThemeData(
          color: appThemeColors.primaryColor, linearTrackColor: appThemeColors.backgroundColor),
      primarySwatch: appThemeColors.primaryColor.toMaterialColor(),
      fontFamily: localeEn ? "roboto" : "cocon",
      brightness: brightness,
      useMaterial3: true,
    );
  }

  static TextTheme appTextTheme(Color color) => TextTheme(
        displayLarge: TextStyle(fontSize:70.0.h , fontWeight: FontWeight.bold, color: color),
        displayMedium: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.w400, color: color),
        displaySmall: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400, color: color),
        headlineLarge: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w400, color: color),
        headlineMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400, color: color),
        headlineSmall: TextStyle(fontSize:ScreenUtil().orientation==Orientation.portrait? 24.sp:18.sp, fontWeight: FontWeight.w400, color: color),
        bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: color),
        bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: color),
        bodySmall: TextStyle(fontSize:ScreenUtil().orientation==Orientation.portrait?12.sp:8.sp, fontWeight: FontWeight.w400, color: color),
        titleLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: color),
        titleMedium:TextStyle(fontSize:ScreenUtil().orientation==Orientation.portrait?  16.sp:8.sp, fontWeight: FontWeight.bold, color: color),
        titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: color),
        labelLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: color),
        labelMedium: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: color),
        labelSmall: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: color),


      );
}
