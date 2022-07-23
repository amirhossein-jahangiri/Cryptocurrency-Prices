import 'package:flutter/material.dart';

import '../constants/route_name_constants.dart';
import '../ui/screens/live/live_screen.dart';

class RouteConfig {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNameCons.liveScreen: (context) => const LiveScreen(),
  };
}
