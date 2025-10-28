import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/core/extension/animation_extensions/animated_list_extension.dart';
import 'package:personal_portfolio/core/extension/widget_extension.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';
import 'package:personal_portfolio/feature/landing/widgets/custom_header_widget.dart';
import 'package:personal_portfolio/feature/landing/widgets/project_card_widget.dart';

class MyWorkSectionForTabletAndDesktop extends StatelessWidget {
  const MyWorkSectionForTabletAndDesktop({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: [
        CustomHeaderWidget(
          title: 'My work',
          titleStyle: AppTextStyle.text10MMain(
            context,
            color: AppColor.yellowColor(context),
          ),
          subtitleStyle: AppTextStyle.text6LLightGrey(context),
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
                  fontSize: 10.sp,
                  circleRadius: 14,
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
