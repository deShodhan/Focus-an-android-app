
import 'package:flutter/material.dart';
import 'package:stayfocused/config/size_config.dart';

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xFFFFF7EC);
  static const Color topBarBackgroundColor = Color(0xFFFFD974);
  static const Color selectedTabBackgroundColor = Color(0xFFFFC442);
  static const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
  static const Color subTitleTextColor = Color(0xFF9F988F);




  static const Color background = Color(0XFFfefefe);

  static const Color titleTextColor = const Color(0xff1b1718);

  static const Color skyBlue = Color(0xff71b4fb);
  static const Color lightBlue = Color(0xff7fbcfb);
  static const Color extraLightBlue = Color(0xffd9eeff);

  static const Color orange = Color(0xfffa8c73);
  static const Color lightOrange = Color(0xfffa9881);

  static const Color yellow = Color(0xffffa1);
  static const Color lightYellow = Color(0xffffd4);

  static const Color purple = Color(0xff8873f4);
  static const Color purpleLight = Color(0xff9489f4);
  static const Color purpleExtraLight = Color(0xffb1a5f6);

  static const Color grey = Color(0xffb8bfce);

  static const Color iconColor = Color(0xffcbd0db);
  static const Color green = Color(0xff4cd1bc);
  static const Color lightGreen = Color(0xff5ed6c3);

  static const Color black = Color(0xff20262C);
  static const Color lightblack = Color(0xff5F5F60);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppTheme.appBackgroundColor,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    title: _titleLight,
    subhead: _titleGreen,
    subtitle: _subTitleLight,
    button: _buttonLight,
    display1: _greetingLight,
    display2: _searchLight,
    display3: _titleBold,
    display4: _pointsTitle,
    body1: _selectedTabLight,
    body2: _unSelectedTabLight,
  );

  static final TextTheme darkTextTheme = TextTheme(
    title: _titleDark,
    subhead: _titleDarkGreen,
    subtitle: _subTitleDark,
    button: _buttonDark,
    display1: _greetingDark,
    display2: _searchDark,
    display3: _titleBold,
    display4: _pointsTitle,
    body1: _selectedTabDark,
    body2: _unSelectedTabDark,
  );

  static final TextStyle _titleGreen = TextStyle(
      color: Colors.green,
      fontSize: 3.5 * SizeConfig.textMultiplier,
      fontWeight: FontWeight.w500
  );

  static final TextStyle _pointsTitle = TextStyle(
      color: Colors.black,
      fontSize: 9.5 * SizeConfig.textMultiplier,
      fontWeight: FontWeight.bold
  );

  static final TextStyle _titleBold = TextStyle(
    color: Colors.black,
    fontSize: 5.5 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.bold
  );

  static final TextStyle _titleLight = TextStyle(
    color: Colors.black,
    fontSize: 3.5 * SizeConfig.textMultiplier,
  );

  static final TextStyle _subTitleLight = TextStyle(
    color: subTitleTextColor,
    fontSize: 2 * SizeConfig.textMultiplier,
    height: 1.5,
  );

  static final TextStyle _buttonLight = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 3.5 * SizeConfig.textMultiplier,
  );

  static final TextStyle _greetingLight = TextStyle(
    color: Colors.black,
    fontSize: 2.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle _searchLight = TextStyle(
    color: Colors.black,
    fontSize: 2.3 * SizeConfig.textMultiplier,
  );

  static final TextStyle _selectedTabLight = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 3 * SizeConfig.textMultiplier,
  );

  static final TextStyle _unSelectedTabLight = TextStyle(
    color: Colors.grey,
    fontSize: 3 * SizeConfig.textMultiplier,
  );

  static final TextStyle _titleDark = _titleLight.copyWith(color: Colors.white);

  static final TextStyle _titleDarkGreen = _titleLight.copyWith(color: Colors.green);

  static final TextStyle _subTitleDark = _subTitleLight.copyWith(color: Colors.white70);

  static final TextStyle _buttonDark = _buttonLight.copyWith(color: Colors.black);

  static final TextStyle _greetingDark = _greetingLight.copyWith(color: Colors.black);

  static final TextStyle _searchDark = _searchDark.copyWith(color: Colors.black);

  static final TextStyle _selectedTabDark = _selectedTabDark.copyWith(color: Colors.white);

  static final TextStyle _unSelectedTabDark = _selectedTabDark.copyWith(color: Colors.white70);
}