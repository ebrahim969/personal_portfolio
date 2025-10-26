import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/responsive_navigation_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/footer_section.dart';

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.scaffoldColor(context),
              AppColor.scaffoldColor(context).withOpacity(0.95),
            ],
          ),
        ),
        child: Column(
          children: [
            // Responsive Navigation Bar
            ResponsiveNavigationBar(
              onHomeTap: () => _scrollToSection(_heroKey),
              onAboutTap: () => _scrollToSection(_aboutKey),
              onProjectsTap: () => _scrollToSection(_projectsKey),
              onExperienceTap: () => _scrollToSection(_experienceKey),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    // Hero Section
                    HeroSection(key: _heroKey),

                    // About Section
                    AboutSection(key: _aboutKey),

                    // Projects Section
                    ProjectsSection(key: _projectsKey),

                    // Experience Section
                    ExperienceSection(key: _experienceKey),

                    // Footer Section
                    FooterSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
