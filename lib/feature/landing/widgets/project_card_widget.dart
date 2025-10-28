import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/core/extension/widget_extension.dart';
import 'package:personal_portfolio/core/images/app_images.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.framework});
  final ResponsiveBreakpointsData framework;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.whiteColor(context),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Image.asset(AppImages.assetsImagesAvatar),
            ),
            8.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zini',
                  style: AppTextStyle.luckiestGuyStyle(
                    context,
                    color: AppColor.mainAppColor(context),
                    fontSize: framework.isDesktop || framework.isTablet
                        ? 7.sp
                        : 16.sp,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'lorem spam at the summeris good and this sis also finica as well ass, lorem spam at the summeris good and this sis also finica as well ass',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.text6LLightGrey(
                    context,
                    color: AppColor.whiteColor(context),
                    fontSize: framework.isDesktop || framework.isTablet
                        ? 3.sp
                        : 8.sp,
                  ),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    ...List.generate(3, (index) {
                      return CircleAvatar(
                        radius: framework.isDesktop ? 15 : 10,
                        backgroundImage: AssetImage(
                          AppImages.assetsImagesSingIn,
                        ),
                      ).paddingEnd(5);
                    }),
                    Spacer(),
                    Text('data'),
                    4.horizontalSpace,
                    Text('data'),
                  ],
                ),
                4.verticalSpace,
              ],
            ).paddingHorizontal(
              framework.isDesktop || framework.isTablet ? 8.w : 16.w,
            ),
            10.verticalSpace,
          ],
        ).withGlassEffect(hasBorder: false),
      ),
    );
  }
}
