import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: this widget for display list of crypto currencies with SliverList widget

class LiveScreenCryptoCurrenciesList extends StatelessWidget {
  const LiveScreenCryptoCurrenciesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF202026),
            //color: Colors.green,
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
              // TODO: crypto image
              CircleAvatar(
                backgroundImage: const AssetImage('assets/logo/btc_logo.png'),
                radius: 20.r,
              ),
              // TODO: column for name and title
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Bitcoin',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    const Text(
                      'BTC',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xFF71737a),
                      ),
                    ),
                  ],
                ),
              ),
              // TODO: chart of crypto price
              const Spacer(),
              // TODO: column for price and swing trading
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const FittedBox(
                      clipBehavior: Clip.none,
                      child: Text(
                        '\$22.000.0000',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    const FittedBox(
                      clipBehavior: Clip.none,
                      child: Text(
                        '+4.785',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        childCount: 10,
      ),
    );
  }
}
