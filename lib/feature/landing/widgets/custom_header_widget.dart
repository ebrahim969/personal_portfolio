import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({
    super.key,
    required this.title,
    this.actionText,
    required this.framework,
  });
  final String title;
  final String? actionText;
  final ResponsiveBreakpointsData framework;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: framework.isDesktop || framework.isTablet
              ? AppTextStyle.luckiestGuyStyle(
                  context,
                  color: AppColor.yellowColor(context),
                  fontSize: 4.sp,
                )
              : AppTextStyle.luckiestGuyStyle(
                  context,
                  color: AppColor.yellowColor(context),
                  fontSize: 14.sp,
                ),
        ),
        Spacer(),
        Text(
          actionText ?? '',
          style: framework.isDesktop || framework.isTablet
              ? AppTextStyle.text6LLightGrey(context, fontSize: 3.sp)
              : AppTextStyle.text12MDarkGrey(
                  context,
                  color: AppColor.greyColor(context),
                ),
        ),
      ],
    );
  }
}
