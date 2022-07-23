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
              hintText: AppConstants.searchBoxHintText,
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
    );
  }
}
