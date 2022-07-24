import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/constants/app_constants.dart';

// TODO: this widget for display appBar widget in live screen Sliver AppBar with Custom Scroll View

class CustomAppBar extends StatelessWidget {
  final Widget? title;
  final bool? isLiveScreen;

  const CustomAppBar({
    required this.title,
    this.isLiveScreen = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      forceElevated: true,
      toolbarHeight: 60.h,
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      title: title!,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        ),
        SizedBox(width: 4.w),
      ],
    );
  }
}
