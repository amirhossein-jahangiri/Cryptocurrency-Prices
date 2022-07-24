import 'package:flutter/material.dart';

import '../constants/route_name_constants.dart';
import '../ui/screens/live/live_screen.dart';
import '../ui/screens/digital-currency-details/digital_currency_details_screen.dart';

class RouteConfig {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNameCons.liveScreen: (context) { // TODO: live screen or home screen
      return const LiveScreen();
    },
    RouteNameCons.digitalCurrencyDetailsScreen: (context) { // TODO: digital currency details screen
      return const DigitalCurrencyDetailsScreen();
    },
  };
}
