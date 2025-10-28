import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/core/extension/animation_extensions/animated_list_extension.dart';
import 'package:personal_portfolio/core/extension/widget_extension.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/feature/landing/widgets/custom_header_widget.dart';
import 'package:personal_portfolio/feature/landing/widgets/project_card_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyWorkSectionForTabletAndDesktop extends StatelessWidget {
  const MyWorkSectionForTabletAndDesktop({
    super.key,
    this.height,
    required this.framework,
  });
  final double? height;
  final ResponsiveBreakpointsData framework;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: [
        CustomHeaderWidget(
          title: 'My work',
          framework: framework,
          actionText: 'Latest work made by ibrahim Elenmr',
        ),
        Divider(color: AppColor.dividerColor(context)),
        16.verticalSpace,
        SizedBox(
          height: height ?? 250.h,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProjectCardWidget(
                  framework: framework,
                ).animateStaggered(index);
              },
              separatorBuilder: (context, index) => 16.horizontalSpace,
              itemCount: 5,
            ),
          ),
        ),
        40.verticalSpace,
      ].animateStaggeredList().paddingHorizontal(30.w),
    );
  }
}
