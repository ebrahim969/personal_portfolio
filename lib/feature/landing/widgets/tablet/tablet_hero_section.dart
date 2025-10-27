import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_portfolio/core/custom_widgets/custom_loading/custom_loading.dart';
import 'package:personal_portfolio/core/extension/widget_extension.dart';
import 'package:personal_portfolio/core/images/app_images.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';
import 'package:personal_portfolio/feature/landing/widgets/glowing_dot_widget.dart';

class TabletHeroSection extends StatelessWidget {
  const TabletHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Iam',
                  style: AppTextStyle.luckiestGuyStyle(
                    context,
                    fontSize: 20.sp,
                  ),
                ),
                8.verticalSpace,
                Text(
                  'Ibrahim Elnemr',
                  style: AppTextStyle.luckiestGuyStyle(
                    context,
                    color: AppColor.mainAppColor(context),
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        32.verticalSpace,

        Row(
          children: [
            Text(
              '" You can develop your dream app right now "',
              style: AppTextStyle.text12RLightGrey(context),
            ),
            Spacer(),
            GlowingDotWidget(
              color: AppColor.mainAppColor(context),
            ).paddingEnd(20),
          ],
        ),
        60.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Lottie.asset(
                AppImages.assetsAnimationHeroAnimation,
                frameBuilder: (context, child, composition) {
                  if (composition == null) {
                    return const Center(child: CustomLoading());
                  }
                  return child;
                },
              ),
            ),
            Column(
              children: [
                Text(
                  'Working As.',
                  style: AppTextStyle.luckiestGuyStyle(
                    context,
                    fontSize: 20.sp,
                  ),
                ),
                16.verticalSpace,
                Text(
                  'Flutter Developer',
                  style: AppTextStyle.luckiestGuyStyle(
                    context,
                    color: AppColor.mainAppColor(context),
                    fontSize: 15.sp,
                  ),
                ),
                24.verticalSpace,
                Lottie.asset(AppImages.assetsAnimationFlutterLogo),
              ],
            ),
          ],
        ),
      ],
    ).paddingHorizontal(16.w);
  }
}
