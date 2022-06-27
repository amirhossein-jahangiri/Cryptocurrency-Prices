import 'package:flutter/material.dart';

import '../constants/route_name_constants.dart';
import '../ui/screens/home/home_screen.dart';

class RouteConfig {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNameCons.HOME_SCREEN_NAME: (context) => const HomeScreen(),
  };
}