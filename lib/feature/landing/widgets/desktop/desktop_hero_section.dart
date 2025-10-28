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

class DesktopHeroSection extends StatelessWidget {
  const DesktopHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        50.verticalSpace,
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Hello, Iam',
                      textStyle: AppTextStyle.luckiestGuyStyle(
                        context,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                Text(
                  'Ibrahim Elnemr',
                  style: AppTextStyle.luckiestGuyStyle(
                    context,
                    color: AppColor.mainAppColor(context),
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        42.verticalSpace,

        Row(
          children: [
            Text(
              '" You can develop\n your dream app\n right now "',
              style: AppTextStyle.text6LLightGrey(context, fontSize: 4.sp),
              textAlign: TextAlign.center,
            ),
            8.horizontalSpace,

            GlowingDotWidget(color: AppColor.mainAppColor(context)),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Working As',
                      style: AppTextStyle.luckiestGuyStyle(
                        context,
                        fontSize: 8.sp,
                      ),
                    ),
                    8.horizontalSpace,
                    Lottie.asset(AppImages.assetsAnimationFlutterLogo),
                  ],
                ),

                16.verticalSpace,
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Flutter Developer',
                      textStyle: AppTextStyle.luckiestGuyStyle(
                        context,
                        color: AppColor.mainAppColor(context),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                  totalRepeatCount: 1,
                ),
              ],
            ),
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
          height: 500.h,
        ),
      ],
    ).paddingHorizontal(70.w);
  }
}
