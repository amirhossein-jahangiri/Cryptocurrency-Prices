import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/constants/app_constants.dart';

// TODO: this widget for display search box in live screen with SliverList widget

class LiveScreenSearchBox extends StatelessWidget {
  const LiveScreenSearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 2.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 1.0,
            ),
          ),
          alignment: Alignment.center,
          child: TextField(
            style: Theme.of(context).textTheme.titleMedium,
            cursorHeight: 22.h,
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                iconSize: 21.r,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.tune),
                iconSize: 21.r,
              ),
              hintText: AppConstants.searchBoxHintText,
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ]),
    );
  }
}
