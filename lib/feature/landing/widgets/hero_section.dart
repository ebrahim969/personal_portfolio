import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/utils/responsive_helper.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _floatingController;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();
    _floatingController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _floatingAnimation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );
    _floatingController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);
        final isTablet = ResponsiveHelper.isTablet(context);

        return Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          padding: ResponsiveHelper.getResponsivePadding(
            context,
            mobile: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            tablet: EdgeInsets.symmetric(horizontal: 40.w, vertical: 60.h),
            desktop: EdgeInsets.symmetric(horizontal: 60.w, vertical: 80.h),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return isMobile
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Mobile: Stack content vertically
                        _buildContent(context, isMobile),
                        SizedBox(height: 40.h),
                        _buildAvatar(context, isMobile),
                      ],
                    )
                  : Row(
                      children: [
                        // Desktop/Tablet: Side by side layout
                        Expanded(
                          flex: isTablet ? 2 : 3,
                          child: _buildContent(context, isMobile),
                        ),
                        SizedBox(
                          width: ResponsiveHelper.getResponsiveSpacing(
                            context,
                            mobile: 20.w,
                            tablet: 30.w,
                            desktop: 40.w,
                          ),
                        ),
                        Expanded(
                          flex: isTablet ? 1 : 2,
                          child: _buildAvatar(context, isMobile),
                        ),
                      ],
                    );
            },
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // Greeting
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: Text(
            'Hello, I am',
            style: AppTextStyle.luckiestGuyStyle(context).copyWith(
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                mobile: 20.sp,
                tablet: 22.sp,
                desktop: 24.sp,
              ),
              color: AppColor.greyColor(context),
            ),
          ),
        ),

        SizedBox(
          height: ResponsiveHelper.getResponsiveSpacing(
            context,
            mobile: 16.h,
            tablet: 20.h,
            desktop: 24.h,
          ),
        ),

        // Name
        FadeInUp(
          duration: const Duration(milliseconds: 1200),
          delay: const Duration(milliseconds: 200),
          child: Text(
            'Ibrahim Elnemr',
            style: AppTextStyle.luckiestGuyStyle(context).copyWith(
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                mobile: 32.sp,
                tablet: 40.sp,
                desktop: 48.sp,
              ),
              fontWeight: FontWeight.bold,
              color: AppColor.mainAppColor(context),
              shadows: [
                Shadow(
                  color: AppColor.mainAppColor(context).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: ResponsiveHelper.getResponsiveSpacing(
            context,
            mobile: 16.h,
            tablet: 20.h,
            desktop: 24.h,
          ),
        ),

        // Title
        FadeInUp(
          duration: const Duration(milliseconds: 1400),
          delay: const Duration(milliseconds: 400),
          child: Text(
            'Flutter Developer & UI/UX Designer',
            style: AppTextStyle.text16MWhite(context).copyWith(
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                mobile: 16.sp,
                tablet: 18.sp,
                desktop: 20.sp,
              ),
              color: AppColor.darkTextColor(context),
              letterSpacing: 1.2,
            ),
          ),
        ),

        SizedBox(
          height: ResponsiveHelper.getResponsiveSpacing(
            context,
            mobile: 24.h,
            tablet: 32.h,
            desktop: 40.h,
          ),
        ),

        // Description
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          delay: const Duration(milliseconds: 600),
          child: Text(
            'Passionate about creating beautiful, functional, and user-friendly mobile and web applications. I specialize in Flutter development and modern UI/UX design.',
            style: AppTextStyle.text14RDark(context).copyWith(
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                mobile: 14.sp,
                tablet: 15.sp,
                desktop: 16.sp,
              ),
              color: AppColor.greyColor(context),
              height: 1.6,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),

        SizedBox(
          height: ResponsiveHelper.getResponsiveSpacing(
            context,
            mobile: 40.h,
            tablet: 50.h,
            desktop: 60.h,
          ),
        ),

        // CTA Buttons
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          delay: const Duration(milliseconds: 800),
          child: Wrap(
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            spacing: ResponsiveHelper.getResponsiveSpacing(
              context,
              mobile: 16.w,
              tablet: 20.w,
              desktop: 24.w,
            ),
            children: [
              _buildPrimaryButton(context),
              _buildSecondaryButton(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context, bool isMobile) {
    return FadeInRight(
      duration: const Duration(milliseconds: 2000),
      delay: const Duration(milliseconds: 1000),
      child: AnimatedBuilder(
        animation: _floatingAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _floatingAnimation.value),
            child: Center(
              child: Container(
                width: ResponsiveHelper.getResponsiveValue(
                  context,
                  mobile: 200.w,
                  tablet: 250.w,
                  desktop: 300.w,
                ),
                height: ResponsiveHelper.getResponsiveValue(
                  context,
                  mobile: 200.w,
                  tablet: 250.w,
                  desktop: 300.w,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColor.whiteColor(context),
                      AppColor.mainAppColor(context).withOpacity(0.1),
                      AppColor.secondAppColor(context).withOpacity(0.05),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.mainAppColor(context).withOpacity(0.2),
                      blurRadius: 30,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/avatar.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return Container(
      height: ResponsiveHelper.getResponsiveValue(
        context,
        mobile: 45.h,
        tablet: 50.h,
        desktop: 55.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getResponsiveValue(
          context,
          mobile: 20.w,
          tablet: 24.w,
          desktop: 28.w,
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.mainAppColor(context),
            AppColor.mainAppColor(context).withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.mainAppColor(context).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25.r),
          onTap: () {
            // Scroll to projects section
          },
          child: Center(
            child: Text(
              'View My Work',
              style: AppTextStyle.text16MWhite(context).copyWith(
                fontSize: ResponsiveHelper.getResponsiveFontSize(
                  context,
                  mobile: 14.sp,
                  tablet: 15.sp,
                  desktop: 16.sp,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(BuildContext context) {
    return Container(
      height: ResponsiveHelper.getResponsiveValue(
        context,
        mobile: 45.h,
        tablet: 50.h,
        desktop: 55.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getResponsiveValue(
          context,
          mobile: 20.w,
          tablet: 24.w,
          desktop: 28.w,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.mainAppColor(context), width: 2),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25.r),
          onTap: () {
            // Scroll to about section
          },
          child: Center(
            child: Text(
              'Get In Touch',
              style: AppTextStyle.text16MSecond(context).copyWith(
                fontSize: ResponsiveHelper.getResponsiveFontSize(
                  context,
                  mobile: 14.sp,
                  tablet: 15.sp,
                  desktop: 16.sp,
                ),
                fontWeight: FontWeight.w600,
                color: AppColor.mainAppColor(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
