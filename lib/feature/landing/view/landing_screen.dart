import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:personal_portfolio/feature/landing/view/layouts/desktop_layout.dart';
import 'package:personal_portfolio/feature/landing/view/layouts/mobile_layout.dart';
import 'package:personal_portfolio/feature/landing/view/layouts/tablet_layout.dart';
import '../widgets/responsive_navigation_bar.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: LayoutBuilder(
        builder: (context, constrains) {
          log(constrains.maxWidth.toString());
          return Stack(
            children: [
              if (constrains.maxWidth <= 600) ...{
                MobileLayout(),
              } else if (constrains.maxWidth <= 1200) ...{
                TabletLayout(),
              } else ...{
                DesktopLayout(),
              },
              ResponsiveNavigationBar(
                onHomeTap: () => _scrollToSection(_heroKey),
                onAboutTap: () => _scrollToSection(_aboutKey),
                onProjectsTap: () => _scrollToSection(_projectsKey),
                onExperienceTap: () => _scrollToSection(_experienceKey),
                maxWidth: constrains.maxWidth,
              ),
            ],
          );
        },
      ),
    );
  }
}
