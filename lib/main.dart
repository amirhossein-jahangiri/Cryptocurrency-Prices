import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/route_name_constants.dart';
import 'config/route_config.dart';
import 'modules/providers/crypto%20currencies_provider.dart';


void main() {
  // TODO: for portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CryptoCurrenciesProvider()),
      ],
      child: const CryptoCurrency(),
    ),
  );

}

class CryptoCurrency extends StatelessWidget {
  const CryptoCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          title: 'Cryptocurrency Prices Application',
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNameCons.liveScreen,
          routes: RouteConfig.routes,
        );
      },
    );
  }
}
