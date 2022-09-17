import 'package:flutter/material.dart';

class AppTheme {

  static const Color colorPrimary = Color(0xFF1572A1);
  static const Color colorWhite = Colors.white;
  static const Color colorBlack = Color(0xff151515);
  static const Color colorCancel = Color(0xffEE6983);
  static const Color colorGrey = Colors.grey;

  static const double sizeSmall =  20.0;
  static const double sizeMedium = 36.0;
  static const double sizeLarge = 40.0;

  static TextStyle? textStyleText = const TextStyle(fontSize: sizeMedium, fontWeight: FontWeight.w400, color: colorBlack);
  //static TextStyle? textStyleTextSmall => const TextStyle(fontSize: sizeSmall, fontWeight: FontWeight.w400, color: colorBlack);

  static final ThemeData theme  = ThemeData(
    primaryColor: colorPrimary,
    backgroundColor: colorPrimary,
    appBarTheme: const AppBarTheme(
      color: colorPrimary,
      titleTextStyle: TextStyle(fontWeight: FontWeight.w500, color: colorWhite, fontSize: 22),
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyText1: textStyleText,
      bodyText2: textStyleText,
      button: textStyleText
    ),
    iconTheme: const IconThemeData(
      color: colorBlack
    ),
    scaffoldBackgroundColor: colorWhite,
      visualDensity: VisualDensity.adaptivePlatformDensity
  );

  /*ThemeData get themeSmall  => ThemeData(
      primaryColor: colorPrimary,
      backgroundColor: colorPrimary,
      appBarTheme: const AppBarTheme(
        color: colorPrimary,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w500, color: colorWhite, fontSize: 18),
        centerTitle: true,
        elevation: 0,
      ),
      textTheme: TextTheme(
          bodyText1: textStyleTextSmall,
          bodyText2: textStyleTextSmall,
          button: textStyleTextSmall
      ),
      iconTheme: const IconThemeData(
          color: colorBlack
      ),
      scaffoldBackgroundColor: colorWhite,
      visualDensity: VisualDensity.adaptivePlatformDensity
  );*/

  static TextStyle? textStyleMoney = theme.textTheme.copyWith(
    bodyText1: const TextStyle(fontSize: sizeLarge, color: colorWhite, fontWeight: FontWeight.w500),
  ).bodyText1;

  static TextStyle? textStyleCurrency = theme.textTheme.copyWith(
    bodyText1: const TextStyle(color: colorWhite, fontWeight: FontWeight.bold),
  ).bodyText1;

  static TextStyle? textStyleClean = theme.textTheme.button?.copyWith(color: colorCancel);
}