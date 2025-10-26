import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/utils/responsive_helper.dart';

class ResponsiveNavigationBar extends StatefulWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;

  const ResponsiveNavigationBar({
    super.key,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);
        final isTablet = ResponsiveHelper.isTablet(context);
        final isDesktop = ResponsiveHelper.isDesktop(context);

        return Stack(
          children: [
            Container(
              height: ResponsiveHelper.getResponsiveValue(
                context,
                mobile: 70.h,
                tablet: 80.h,
                desktop: 90.h,
              ),
              decoration: BoxDecoration(
                color: AppColor.whiteColor(context).withOpacity(0.95),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blackColor(context).withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: ResponsiveHelper.getResponsivePadding(
                  context,
                  mobile: EdgeInsets.symmetric(horizontal: 16.w),
                  tablet: EdgeInsets.symmetric(horizontal: 24.w),
                  desktop: EdgeInsets.symmetric(horizontal: 32.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo
                    FadeInLeft(
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        'Ibrahim Elnemr',
                        style: AppTextStyle.text20SSecond(context).copyWith(
                          fontSize: ResponsiveHelper.getResponsiveFontSize(
                            context,
                            mobile: 20.sp,
                            tablet: 22.sp,
                            desktop: 24.sp,
                          ),
                          fontWeight: FontWeight.bold,
                          color: AppColor.mainAppColor(context),
                        ),
                      ),
                    ),

                    // Desktop/Tablet Navigation
                    if (isDesktop || isTablet)
                      FadeInRight(
                        duration: const Duration(milliseconds: 800),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            // Check if we have enough space for horizontal navigation
                            final availableWidth =
                                constraints.maxWidth -
                                200.w; // Reserve space for logo
                            final navItemWidth =
                                ResponsiveHelper.getResponsiveValue(
                                  context,
                                  mobile: 80.w,
                                  tablet: 90.w,
                                  desktop: 100.w,
                                );
                            final spacing =
                                ResponsiveHelper.getResponsiveSpacing(
                                  context,
                                  mobile: 20.w,
                                  tablet: 25.w,
                                  desktop: 30.w,
                                );

                            final totalNavWidth =
                                (4 * navItemWidth) + (3 * spacing);

                            if (availableWidth >= totalNavWidth) {
                              // Horizontal navigation
                              return Row(
                                children: [
                                  _NavItem(
                                    text: 'Home',
                                    onTap: widget.onHomeTap,
                                  ),
                                  SizedBox(width: spacing),
                                  _NavItem(
                                    text: 'About',
                                    onTap: widget.onAboutTap,
                                  ),
                                  SizedBox(width: spacing),
                                  _NavItem(
                                    text: 'Projects',
                                    onTap: widget.onProjectsTap,
                                  ),
                                  SizedBox(width: spacing),
                                  _NavItem(
                                    text: 'Experience',
                                    onTap: widget.onExperienceTap,
                                  ),
                                ],
                              );
                            } else {
                              // Compact navigation with dropdown or fewer items
                              return Row(
                                children: [
                                  _NavItem(
                                    text: 'Home',
                                    onTap: widget.onHomeTap,
                                  ),
                                  SizedBox(width: spacing),
                                  _NavItem(
                                    text: 'About',
                                    onTap: widget.onAboutTap,
                                  ),
                                  SizedBox(width: spacing),
                                  _NavItem(
                                    text: 'Projects',
                                    onTap: widget.onProjectsTap,
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ),

                    // Mobile Menu Button
                    if (isMobile)
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
                  ],
                ),
              ),
            ),

            // Mobile Menu Overlay
            if (isMobile && _isMenuOpen)
              Positioned(
                top: 70.h,
                left: 0,
                right: 0,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    height: 280.h,
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor(context),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.blackColor(context).withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _MobileNavItem(
                          text: 'Home',
                          icon: Icons.home,
                          onTap: () {
                            widget.onHomeTap();
                            _toggleMenu();
                          },
                        ),
                        _MobileNavItem(
                          text: 'About',
                          icon: Icons.person,
                          onTap: () {
                            widget.onAboutTap();
                            _toggleMenu();
                          },
                        ),
                        _MobileNavItem(
                          text: 'Projects',
                          icon: Icons.work,
                          onTap: () {
                            widget.onProjectsTap();
                            _toggleMenu();
                          },
                        ),
                        _MobileNavItem(
                          text: 'Experience',
                          icon: Icons.timeline,
                          onTap: () {
                            widget.onExperienceTap();
                            _toggleMenu();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _NavItem extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _NavItem({required this.text, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColor.mainAppColor(context).withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            widget.text,
            style: AppTextStyle.text16MSecond(context).copyWith(
              color: _isHovered
                  ? AppColor.mainAppColor(context)
                  : AppColor.darkTextColor(context),
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _MobileNavItem({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Icon(icon, size: 20.w, color: AppColor.mainAppColor(context)),
            SizedBox(width: 12.w),
            Text(
              text,
              style: AppTextStyle.text16MSecond(context).copyWith(
                fontSize: 16.sp,
                color: AppColor.darkTextColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
