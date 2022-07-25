import 'package:cryptocurrency_prices/ui/screens/custom-widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DigitalCurrencyDetailsScreen extends StatelessWidget {
  const DigitalCurrencyDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
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
                SizedBox(height: 10.h),
              ]),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.shade800,
                          offset: const Offset(0, 1),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Key',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          'Value',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
