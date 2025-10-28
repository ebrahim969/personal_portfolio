import 'package:flutter/material.dart';
import 'package:personal_portfolio/feature/landing/view/layouts/desktop_layout.dart';
import 'package:personal_portfolio/feature/landing/view/layouts/mobile_layout.dart';
import 'package:personal_portfolio/feature/landing/view/layouts/tablet_layout.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
    final frameWork = ResponsiveBreakpoints.of(context);
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        children: [
          if (frameWork.isMobile) ...{
            MobileLayout(),
          } else if (frameWork.isTablet) ...{
            TabletLayout(),
          } else if (frameWork.isDesktop) ...{
            DesktopLayout(),
          },
          ResponsiveNavigationBar(
            onHomeTap: () => _scrollToSection(_heroKey),
            onAboutTap: () => _scrollToSection(_aboutKey),
            onProjectsTap: () => _scrollToSection(_projectsKey),
            onExperienceTap: () => _scrollToSection(_experienceKey),
            framework: frameWork,
          ),
        ],
      ),
    );
  }
}
