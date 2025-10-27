import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_portfolio/core/images/app_images.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';

class WorkingAsWidget extends StatelessWidget {
  const WorkingAsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text('Working As.', style: AppTextStyle.luckiestGuyStyle(context)),
            16.verticalSpace,
            Text(
              'Flutter Developer',
              style: AppTextStyle.luckiestGuyStyle(
                context,
                color: AppColor.mainAppColor(context),
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
        Spacer(),
        Lottie.asset(AppImages.assetsAnimationFlutterLogo),
      ],
    );
  }
}
