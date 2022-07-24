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
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      title: const Text(AppConstants.appBarTitle),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        )
      ],
    );
  }
}
