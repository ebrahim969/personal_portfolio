import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/utils/responsive_helper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);
        final isTablet = ResponsiveHelper.isTablet(context);

        return Container(
          padding: ResponsiveHelper.getResponsivePadding(
            context,
            mobile: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
            tablet: EdgeInsets.symmetric(horizontal: 40.w, vertical: 80.h),
            desktop: EdgeInsets.symmetric(horizontal: 60.w, vertical: 100.h),
          ),
          decoration: BoxDecoration(color: AppColor.whiteColor(context)),
          child: Column(
            children: [
              // Section Title
              FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  'About Me',
                  style: AppTextStyle.text20SSecond(context).copyWith(
                    fontSize: ResponsiveHelper.getResponsiveFontSize(
                      context,
                      mobile: 28.sp,
                      tablet: 32.sp,
                      desktop: 36.sp,
                    ),
                    fontWeight: FontWeight.bold,
                    color: AppColor.darkTextColor(context),
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

              FadeInUp(
                duration: const Duration(milliseconds: 1200),
                delay: const Duration(milliseconds: 200),
                child: Container(
                  width: ResponsiveHelper.getResponsiveValue(
                    context,
                    mobile: 60.w,
                    tablet: 80.w,
                    desktop: 100.w,
                  ),
                  height: ResponsiveHelper.getResponsiveValue(
                    context,
                    mobile: 3.h,
                    tablet: 4.h,
                    desktop: 5.h,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColor.mainAppColor(context),
                        AppColor.secondAppColor(context),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),

              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(
                  context,
                  mobile: 40.h,
                  tablet: 60.h,
                  desktop: 80.h,
                ),
              ),

              LayoutBuilder(
                builder: (context, constraints) {
                  if (isMobile) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildAboutContent(context, true),
                        SizedBox(height: 40.h),
                        _buildStatsSection(context),
                      ],
                    );
                  } else {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: isTablet ? 2 : 3,
                          child: _buildAboutContent(context, false),
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
                          child: _buildStatsSection(context),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAboutContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        FadeInLeft(
          duration: const Duration(milliseconds: 1000),
          child: Text(
            'Passionate Developer & Designer',
            style: AppTextStyle.text18SSecond(context).copyWith(
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                mobile: 20.sp,
                tablet: 22.sp,
                desktop: 24.sp,
              ),
              fontWeight: FontWeight.bold,
              color: AppColor.darkTextColor(context),
            ),
          ),
        ),

        SizedBox(
          height: ResponsiveHelper.getResponsiveSpacing(
            context,
            mobile: 24.h,
            tablet: 28.h,
            desktop: 32.h,
          ),
        ),

        FadeInLeft(
          duration: const Duration(milliseconds: 1200),
          delay: const Duration(milliseconds: 200),
          child: Text(
            'I am a passionate Flutter developer and UI/UX designer with over 3 years of experience in creating beautiful, functional, and user-friendly mobile and web applications. I love turning complex problems into simple, beautiful, and intuitive designs.',
            style: AppTextStyle.text14RDark(context).copyWith(
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                mobile: 14.sp,
                tablet: 15.sp,
                desktop: 16.sp,
              ),
              color: AppColor.greyColor(context),
              height: 1.8,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),

        SizedBox(
          height: ResponsiveHelper.getResponsiveSpacing(
            context,
            mobile: 32.h,
            tablet: 36.h,
            desktop: 40.h,
          ),
        ),

        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          delay: const Duration(milliseconds: 400),
          child: Text(
            'When I\'m not coding, you can find me exploring new design trends, contributing to open source projects, or sharing my knowledge with the developer community.',
            style: AppTextStyle.text14RDark(context).copyWith(
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                mobile: 14.sp,
                tablet: 15.sp,
                desktop: 16.sp,
              ),
              color: AppColor.greyColor(context),
              height: 1.8,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),

        SizedBox(
          height: ResponsiveHelper.getResponsiveSpacing(
            context,
            mobile: 40.h,
            tablet: 44.h,
            desktop: 48.h,
          ),
        ),

        // Skills
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          delay: const Duration(milliseconds: 600),
          child: Column(
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text(
                'Skills & Technologies',
                style: AppTextStyle.text16MSecond(context).copyWith(
                  fontSize: ResponsiveHelper.getResponsiveFontSize(
                    context,
                    mobile: 16.sp,
                    tablet: 17.sp,
                    desktop: 18.sp,
                  ),
                  fontWeight: FontWeight.bold,
                  color: AppColor.darkTextColor(context),
                ),
              ),

              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(
                  context,
                  mobile: 20.h,
                  tablet: 24.h,
                  desktop: 28.h,
                ),
              ),

              Wrap(
                alignment: isMobile
                    ? WrapAlignment.center
                    : WrapAlignment.start,
                spacing: ResponsiveHelper.getResponsiveSpacing(
                  context,
                  mobile: 12.w,
                  tablet: 14.w,
                  desktop: 16.w,
                ),
                runSpacing: ResponsiveHelper.getResponsiveSpacing(
                  context,
                  mobile: 12.h,
                  tablet: 14.h,
                  desktop: 16.h,
                ),
                children: [
                  _buildSkillChip(context, 'Flutter'),
                  _buildSkillChip(context, 'Dart'),
                  _buildSkillChip(context, 'UI/UX Design'),
                  _buildSkillChip(context, 'Firebase'),
                  _buildSkillChip(context, 'REST APIs'),
                  _buildSkillChip(context, 'Git'),
                  _buildSkillChip(context, 'Figma'),
                  _buildSkillChip(context, 'Adobe XD'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1800),
      delay: const Duration(milliseconds: 800),
      child: Column(
        children: [
          _buildStatCard(context, '50+', 'Projects Completed'),
          SizedBox(
            height: ResponsiveHelper.getResponsiveSpacing(
              context,
              mobile: 16.h,
              tablet: 20.h,
              desktop: 24.h,
            ),
          ),
          _buildStatCard(context, '3+', 'Years Experience'),
          SizedBox(
            height: ResponsiveHelper.getResponsiveSpacing(
              context,
              mobile: 16.h,
              tablet: 20.h,
              desktop: 24.h,
            ),
          ),
          _buildStatCard(context, '100%', 'Client Satisfaction'),
        ],
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColor.mainAppColor(context).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColor.mainAppColor(context).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        skill,
        style: AppTextStyle.text12MMain(
          context,
        ).copyWith(fontSize: 12.sp, color: AppColor.mainAppColor(context)),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String number, String label) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColor.whiteColor(context),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor(context).withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            number,
            style: AppTextStyle.text20SSecond(context).copyWith(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.mainAppColor(context),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: AppTextStyle.text12RDark(
              context,
            ).copyWith(fontSize: 14.sp, color: AppColor.greyColor(context)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
