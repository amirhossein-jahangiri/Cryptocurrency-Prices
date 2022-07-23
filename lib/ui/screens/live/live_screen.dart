import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19191f),
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              forceElevated: true,
              toolbarHeight: 60.h,
              backgroundColor: const Color(0xFF19191f),
              elevation: 0.0,
              centerTitle: true,
              title: const Text(
                'Live Prices',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none),
                  iconSize: 25.r,
                )
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 5.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: const Color(0xFF7a7a83),
                      width: 1.0,
                    ),
                  ),
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    cursorHeight: 25.h,
                    cursorColor: const Color(0xFF7a7a83),
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: const Color(0xFF7a7a83),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.tune),
                        color: const Color(0xFF7a7a83),
                      ),
                      hintText: 'Search ...',
                      hintStyle: const TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF7a7a83),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h
                  ),
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
                            FittedBox(
                              clipBehavior: Clip.none,
                              child: Text(
                                '+4.785',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  //color: Color(0xFF71737a),
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
            ),
          ],
        ),
      ),
    );
  }
}
