import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/constants/app_constants.dart';

// TODO: this widget for display appBar widget in live screen Sliver AppBar with Custom Scroll View

class LiveScreenAppBar extends StatelessWidget {
  const LiveScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      forceElevated: true,
      toolbarHeight: 60.h,
      backgroundColor: const Color(0xFF19191f),
      elevation: 0.0,
      centerTitle: true,
      title: const Text(
        AppConstants.appBarTitle,
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
          color: const Color(0xFF7a7a83),
        )
      ],
    );
  }
}
