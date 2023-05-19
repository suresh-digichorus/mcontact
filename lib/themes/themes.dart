import 'package:flutter/material.dart';
import 'package:mcontact/themes/colors.dart';

class Themes {
  static ThemeData themeData(BuildContext context) => ThemeData(
        canvasColor: AppColors.white,
        appBarTheme: _buildAppBarTheme(),
        textTheme: _buildTextTheme(),
        iconTheme: _buildIconThemeData(),
        buttonTheme: _buildButtonThemeData(),
        elevatedButtonTheme: _buildElevatedButtonThemeData(),
        inputDecorationTheme: _buildInputDecorationTheme(context),
      );

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
            const TextStyle(fontSize: 16),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      );

  static InputDecorationTheme _buildInputDecorationTheme(
          BuildContext context) =>
      InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        focusColor: AppColors.primaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        labelStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: AppColors.grey2e),
      );

// TODO: set the font family
  static TextTheme _buildTextTheme() =>
      const TextTheme()..apply(fontFamily: '');
}
