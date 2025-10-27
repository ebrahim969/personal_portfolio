import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_portfolio/core/extension/widget_extension.dart';
import 'package:personal_portfolio/core/images/app_images.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';
import 'package:personal_portfolio/feature/landing/widgets/glowing_dot_widget.dart';
import 'package:personal_portfolio/feature/landing/widgets/working_as_widget.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Hello, Iam', style: AppTextStyle.luckiestGuyStyle(context)),
        8.verticalSpace,
        Text(
          'Ibrahim Elnemr',
          style: AppTextStyle.luckiestGuyStyle(
            context,
            color: AppColor.mainAppColor(context),
          ),
        ),
        24.verticalSpace,
        Row(
          children: [
            Text(
              '" You can develop your dream app right now "',
              style: AppTextStyle.text16MSecond(
                context,
                color: AppColor.statusGreyColor(context),
              ),
            ),
            Spacer(),
            GlowingDotWidget(
              color: AppColor.mainAppColor(context),
            ).paddingEnd(20),
          ],
        ),
        50.verticalSpace,
        WorkingAsWidget(),
        24.verticalSpace,
        Lottie.asset(AppImages.assetsAnimationHeroAnimation),
      ],
    ).paddingHorizontal(16.w);
  }
}
