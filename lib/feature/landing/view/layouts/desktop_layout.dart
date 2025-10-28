import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/core/extension/animation_extensions/animated_list_extension.dart';
import 'package:personal_portfolio/core/extension/widget_extension.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/feature/landing/widgets/custom_header_widget.dart';
import 'package:personal_portfolio/feature/landing/widgets/desktop/desktop_hero_section.dart';
import 'package:personal_portfolio/feature/landing/widgets/my_work_section_for_tablet_and_desktop.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.framework});
  final ResponsiveBreakpointsData framework;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            100.verticalSpace,
            DesktopHeroSection().animateStaggered(1),
          ]),
        ),
        MyWorkSectionForTabletAndDesktop(height: 270.h, framework: framework),
        SliverToBoxAdapter(
          child: [
            40.verticalSpace,
            CustomHeaderWidget(title: 'About me', framework: framework),
            Divider(color: AppColor.dividerColor(context)),
          ].animateStaggeredList().paddingHorizontal(30.w),
        ),
      ],
    );
  }
}
