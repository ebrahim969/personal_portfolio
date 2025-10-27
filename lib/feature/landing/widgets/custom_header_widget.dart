import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({super.key, required this.title, this.actions});
  final String title;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyle.text20SSecond(
            context,
            color: AppColor.yellowColor(context),
          ),
        ),
        Spacer(),
        actions ??
            Text(
              'Latest works made by ibrahim Elenmr',
              style: AppTextStyle.text14MDark(
                context,
                color: AppColor.greyColor(context),
              ),
            ),
      ],
    );
  }
}
