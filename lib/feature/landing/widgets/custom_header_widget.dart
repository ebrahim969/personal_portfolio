import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({
    super.key,
    required this.title,
    this.actions,
    this.titleStyle,
    this.subtitleStyle,
  });
  final String title;
  final Widget? actions;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:
              titleStyle ??
              AppTextStyle.text16MSecond(
                context,
                color: AppColor.yellowColor(context),
              ),
        ),
        Spacer(),
        actions ??
            Text(
              'Latest works made by ibrahim Elenmr',
              style:
                  subtitleStyle ??
                  AppTextStyle.text12MDarkGrey(
                    context,
                    color: AppColor.greyColor(context),
                  ),
            ),
      ],
    );
  }
}
