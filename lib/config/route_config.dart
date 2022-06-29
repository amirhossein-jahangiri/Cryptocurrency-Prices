import 'package:flutter/material.dart';

import '../constants/route_name_constants.dart';
import '../ui/screens/crypto_currency_details/crypto_currency_details_screen.dart';
import '../ui/screens/home/home_screen.dart';

class RouteConfig {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNameCons.homeScreenRouteName: (context) => const HomeScreen(),
    RouteNameCons.cryptoCurrencyDetailsScreenRouteName: (context) =>
        const CryptoCurrencyDetailsScreen(),
  };
}
