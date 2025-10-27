import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';
import 'package:personal_portfolio/feature/landing/widgets/project_card_widget.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'My work',
              style: AppTextStyle.text20SSecond(
                context,
                color: AppColor.yellowColor(context),
              ),
            ),
            Spacer(),
            Text(
              'Latest works made by ibrahim Elenmr',
              style: AppTextStyle.text14MDark(
                context,
                color: AppColor.greyColor(context),
              ),
            ),
          ],
        ),
        Divider(color: AppColor.dividerColor(context)),
        16.verticalSpace,
        Expanded(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (index, context) {
              return ProjectCardWidget();
            },
          ),
        ),
      ],
    );
  }
}
