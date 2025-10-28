import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/core/extension/widget_extension.dart';
import 'package:personal_portfolio/core/images/app_images.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';
import 'package:personal_portfolio/core/theme/app_text_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveNavigationBar extends StatefulWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final ResponsiveBreakpointsData framework;

  const ResponsiveNavigationBar({
    super.key,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.framework,
  });

  @override
  State<ResponsiveNavigationBar> createState() =>
      _ResponsiveNavigationBarState();
}

class _ResponsiveNavigationBarState extends State<ResponsiveNavigationBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.mainAppColor(context),
                backgroundImage: AssetImage(AppImages.assetsImagesAvatar),
              ),
              const Spacer(),
              if (widget.framework.isDesktop || widget.framework.isTablet) ...{
                Row(
                  children: [
                    TextButton(
                      onPressed: widget.onHomeTap,
                      child: Text(
                        'Home',
                        style: AppTextStyle.appBarStyle(context),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    TextButton(
                      onPressed: widget.onAboutTap,
                      child: Text(
                        'About',
                        style: AppTextStyle.appBarStyle(context),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    TextButton(
                      onPressed: widget.onProjectsTap,
                      child: Text(
                        'Projects',
                        style: AppTextStyle.appBarStyle(context),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    TextButton(
                      onPressed: widget.onExperienceTap,
                      child: Text(
                        'Experience',
                        style: AppTextStyle.appBarStyle(context),
                      ),
                    ),
                  ],
                ),
              } else ...{
                FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: IconButton(
                    onPressed: _toggleMenu,
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _animationController,
                      color: AppColor.mainAppColor(context),
                      size: 24.w,
                    ),
                  ),
                ),
              },
            ],
          ),
        )
        .withGlassEffect(hasBorder: false)
        .paddingSymmetric(widget.framework.isDesktop ? 50.w : 16.w, 16.h);
  }
}
