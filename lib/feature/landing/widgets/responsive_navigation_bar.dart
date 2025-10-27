import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/core/extension/widget_extension.dart';
import 'package:personal_portfolio/core/images/app_images.dart';
import 'package:personal_portfolio/core/theme/app_colors.dart';

class ResponsiveNavigationBar extends StatefulWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final double maxWidth;

  const ResponsiveNavigationBar({
    super.key,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    this.maxWidth = double.infinity,
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
          if (widget.maxWidth >= 600) ...{
            Row(
              children: [
                TextButton(
                  onPressed: widget.onHomeTap,
                  child: const Text('Home'),
                ),
                SizedBox(width: 16.w),
                TextButton(
                  onPressed: widget.onAboutTap,
                  child: const Text('About'),
                ),
                SizedBox(width: 16.w),
                TextButton(
                  onPressed: widget.onProjectsTap,
                  child: const Text('Projects'),
                ),
                SizedBox(width: 16.w),
                TextButton(
                  onPressed: widget.onExperienceTap,
                  child: const Text('Experience'),
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
    ).withGlassEffect(hasBorder: false).paddingAll(16);
  }
}
