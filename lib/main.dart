import 'package:flutter/material.dart';

import 'constants/route_name_constants.dart';
import 'config/route_config.dart';

void main() {
  runApp(const CryptoCurrency());
}

class CryptoCurrency extends StatelessWidget {
  const CryptoCurrency({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocurrency Prices Application',
      initialRoute: RouteNameCons.HOME_SCREEN_NAME,
      routes: RouteConfig.routes,
    );
  }
}