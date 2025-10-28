import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/core/extension/animation_extensions/animated_list_extension.dart';
import 'package:personal_portfolio/feature/landing/widgets/desktop/desktop_hero_section.dart';
import 'package:personal_portfolio/feature/landing/widgets/my_work_section_for_tablet_and_desktop.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

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
        MyWorkSectionForTabletAndDesktop(height: 290.h),
      ],
    );
  }
}
