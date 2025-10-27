import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/core/custom_widgets/buttons/custom_button.dart';
import 'package:personal_portfolio/core/extension/widget_extension.dart';
import 'package:personal_portfolio/core/images/app_images.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.whiteColor(context),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
          ),
          child: Image.asset(AppImages.assetsImagesAvatar, fit: BoxFit.cover),
        ),
        8.verticalSpace,
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zini',
                  style: AppTextStyle.luckiestGuyStyle(
                    context,
                    color: AppColor.lightGreyColor(context),
                    fontSize: 14.sp,
                  ),
                ),
                4.verticalSpace,
                Row(
                  children: List.generate(3, (index) {
                    return CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage(AppImages.assetsImagesSingIn),
                    ).paddingEnd(5);
                  }),
                ),
                4.verticalSpace,
              ],
            ),
            Spacer(),
            CustomButton(height: 30, text: 'Google Play', width: 100),
            4.horizontalSpace,
            CustomButton(height: 30, text: 'App Store', width: 100),
            10.verticalSpace,
          ],
        ).paddingHorizontal(16.w),
      ],
    ).withGlassEffect(hasBorder: false).paddingHorizontal(16.w);
  }
}
