import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_portfolio/core/custom_widgets/custom_loading/custom_loading.dart';
import 'package:personal_portfolio/core/extension/widget_extension.dart';
import 'package:personal_portfolio/core/images/app_images.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';
import 'package:personal_portfolio/feature/landing/widgets/glowing_dot_widget.dart';

class MobileHeroSection extends StatelessWidget {
  const MobileHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Hello, Iam',
              textStyle: AppTextStyle.luckiestGuyStyle(context),
            ),
          ],
        ),
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
              style: AppTextStyle.text12RLightGrey(context),
            ),
            Spacer(),
            GlowingDotWidget(
              color: AppColor.mainAppColor(context),
            ).paddingEnd(20),
          ],
        ),
        50.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Working As.',
                  style: AppTextStyle.luckiestGuyStyle(
                    context,
                    fontSize: 18.sp,
                  ),
                ),
                16.verticalSpace,
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Flutter Developer',
                      textStyle: AppTextStyle.luckiestGuyStyle(
                        context,
                        color: AppColor.mainAppColor(context),
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Lottie.asset(AppImages.assetsAnimationFlutterLogo),
          ],
        ),
        24.verticalSpace,
        Lottie.asset(
          AppImages.assetsAnimationHeroAnimation,
          frameBuilder: (context, child, composition) {
            if (composition == null) {
              return const Center(child: CustomLoading());
            }
            return child;
          },
          height: 250.h,
        ),
      ],
    ).paddingHorizontal(16.w);
  }
}
