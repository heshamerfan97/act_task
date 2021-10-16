import 'package:flutter/material.dart';

/// global variable to access sailor which is a navigation service
/// that controls routes easily and without the need of passing contexts.
// ignore: non_constant_identifier_names
final MyNavigator = _SailorImpl();

/// prevents MyNavigator implementation to be accessed from outside this file.
class _SailorImpl {
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /// global key which controls navigation state
  final _navigatorKey = GlobalKey<NavigatorState>();
}

extension NavigationMethods on _SailorImpl {
  /// use "toNamed" instead of Navigator.pushNamed
  Future<dynamic> toNamed(String routeName, {Object? args}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }


  /// use [replaceWith] instead of [Navigator.pushReplacementNamed]
  Future<dynamic> replaceWith(String routeName, {Object? args}) {
    return _navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: args);
  }

  static BuildContext? currentContext = MyNavigator.navigatorKey.currentState?.overlay?.context;


  /// use "back" instead of Navigator.pop
  void back<T extends Object?>([T? result]) {
    return _navigatorKey.currentState!.pop(result);
  }
}
