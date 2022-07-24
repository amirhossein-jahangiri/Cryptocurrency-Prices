import 'package:cryptocurrency_prices/ui/screens/custom-widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_constants.dart';

class DigitalCurrencyDetailsScreen extends StatelessWidget {
  const DigitalCurrencyDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          //physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            CustomAppBar(
              title: Column(
                children: <Widget>[
                  const Text('Bitcoin'),
                  SizedBox(height: 2.h),
                  Text(
                    '\$27.455.000',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),

            // TODO: swing trading box
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 10.h),
                Placeholder(
                  fallbackHeight: 250.h,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),

              ]),
            ),
          ],
        ),
      ),
    );
  }
}
