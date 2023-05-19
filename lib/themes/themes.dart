import 'package:flutter/material.dart';
import 'package:mcontact/themes/colors.dart';

class Themes {
  static ThemeData themeData() => ThemeData(
      canvasColor: AppColors.white,
      appBarTheme: _buildAppBarTheme(),
      textTheme: _buildTextTheme(),
      iconTheme: _buildIconThemeData(),
      buttonTheme: _buildButtonThemeData(),
      elevatedButtonTheme: _buildElevatedButtonThemeData());

  static AppBarTheme _buildAppBarTheme() => AppBarTheme(
        backgroundColor: AppColors.primaryColor,
      );

  static IconThemeData _buildIconThemeData() =>
      IconThemeData(color: AppColors.white);

  static ButtonThemeData _buildButtonThemeData() => ButtonThemeData(
        buttonColor: AppColors.primaryColor,
      );

  static ElevatedButtonThemeData _buildElevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColors.primaryColor,
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 18),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      );

// TODO: set the font family
  static TextTheme _buildTextTheme() =>
      const TextTheme()..apply(fontFamily: '');
}
