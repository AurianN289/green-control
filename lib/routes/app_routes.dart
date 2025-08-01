import 'package:flutter/material.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/green_control_dashboard_screen/green_control_dashboard_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';
  static const String greenControlDashboardScreen =
      '/green_control_dashboard_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
        loginScreen: (context) => LoginScreen(),
        greenControlDashboardScreen: (context) => GreenControlDashboardScreen(),
        appNavigationScreen: (context) => AppNavigationScreen(),
        initialRoute: (context) => AppNavigationScreen()
      };
}
