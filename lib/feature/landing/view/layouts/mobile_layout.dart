import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/core/extension/animation_extensions/animated_list_extension.dart';
import 'package:personal_portfolio/core/extension/widget_extension.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/feature/landing/widgets/custom_header_widget.dart';
import 'package:personal_portfolio/feature/landing/widgets/mobile/mobile_hero_section.dart';
import 'package:personal_portfolio/feature/landing/widgets/project_card_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, required this.frameWork});
  final ResponsiveBreakpointsData frameWork;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            100.verticalSpace,
            MobileHeroSection(),
          ]),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomHeaderWidget(title: 'My work', framework: frameWork,),
              Divider(color: AppColor.dividerColor(context)),
              16.verticalSpace,
            ],
          ).paddingHorizontal(16.w),
        ),
        SliverList.separated(
          separatorBuilder: (context, index) => 12.verticalSpace,
          itemBuilder: (context, index) {
            return ProjectCardWidget(framework: frameWork,)
                .animateStaggered(index)
                .paddingHorizontal(16.w);
          },
          itemCount: 3,
        ),
      ],
    );
  }
}
