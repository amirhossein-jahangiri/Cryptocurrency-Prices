import 'package:cryptocurrency_prices/constants/app_constants.dart';
import 'package:cryptocurrency_prices/services/rest_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom-widgets/custom_app_bar_widget.dart';
import 'live_screen_widgets/live_screen_crypto_currencies_list_widget.dart';
import 'live_screen_widgets/live_screen_search_box_widget.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            CustomAppBar(title: Text(AppConstants.appBarTitle)),
            LiveScreenSearchBox(),
            LiveScreenCryptoCurrenciesList(),
          ],
        ),
      ),
    );
  }
}


