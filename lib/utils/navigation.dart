import 'package:flutter/material.dart';

///This [Navigation] class is used to apply page transition

class Navigation {
  static Future<dynamic> pushNamed(BuildContext context, routeName,
          [Object? arguments]) =>
      Navigator.of(context).pushNamed(routeName, arguments: arguments);

  static Future<dynamic> pushReplacementNamed(BuildContext context, routeName,
          [Object? arguments]) =>
      Navigator.of(context)
          .pushReplacementNamed(routeName, arguments: arguments);

  static Future<dynamic> pushAndRemoveUntil(
      BuildContext context, String routeName,
      [Object? arguments]) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static dynamic pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future<dynamic> popAndPushNamed(BuildContext context, String routeName,
      [Object? arguments]) {
    return Navigator.of(context)
        .popAndPushNamed(routeName, arguments: arguments);
  }
}
