import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/utils/responsive_helper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);

        return Container(
          padding: ResponsiveHelper.getResponsivePadding(
            context,
            mobile: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
            tablet: EdgeInsets.symmetric(horizontal: 40.w, vertical: 80.h),
            desktop: EdgeInsets.symmetric(horizontal: 60.w, vertical: 100.h),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.scaffoldColor(context),
                AppColor.secondAppColor(context),
              ],
            ),
          ),
          child: Column(
            children: [
              // Contact Section
              FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Column(
                  children: [
                    Text(
                      'Let\'s Work Together',
                      style: AppTextStyle.text20SSecond(context).copyWith(
                        fontSize: ResponsiveHelper.getResponsiveFontSize(
                          context,
                          mobile: 28.sp,
                          tablet: 32.sp,
                          desktop: 36.sp,
                        ),
                        fontWeight: FontWeight.bold,
                        color: AppColor.whiteColor(context),
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

                    Text(
                      'Have a project in mind? Let\'s discuss how we can bring your ideas to life.',
                      style: AppTextStyle.text14RDark(context).copyWith(
                        fontSize: ResponsiveHelper.getResponsiveFontSize(
                          context,
                          mobile: 14.sp,
                          tablet: 15.sp,
                          desktop: 16.sp,
                        ),
                        color: AppColor.whiteColor(context).withOpacity(0.8),
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(
                        context,
                        mobile: 40.h,
                        tablet: 50.h,
                        desktop: 60.h,
                      ),
                    ),

                    // Contact Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildContactButton(
                          context,
                          'Get In Touch',
                          Icons.email,
                          () => _launchEmail(),
                        ),
                        SizedBox(
                          width: ResponsiveHelper.getResponsiveSpacing(
                            context,
                            mobile: 16.w,
                            tablet: 20.w,
                            desktop: 24.w,
                          ),
                        ),
                        _buildContactButton(
                          context,
                          'View Resume',
                          Icons.description,
                          () => _launchResume(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(
                  context,
                  mobile: 60.h,
                  tablet: 80.h,
                  desktop: 100.h,
                ),
              ),

              // Social Links
              FadeInUp(
                duration: const Duration(milliseconds: 1200),
                delay: const Duration(milliseconds: 200),
                child: Column(
                  children: [
                    Text(
                      'Follow Me',
                      style: AppTextStyle.text16MSecond(context).copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.whiteColor(context),
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton(
                          context,
                          Icons.code,
                          'GitHub',
                          () => _launchGitHub(),
                        ),
                        SizedBox(
                          width: ResponsiveHelper.getResponsiveSpacing(
                            context,
                            mobile: 16.w,
                            tablet: 20.w,
                            desktop: 24.w,
                          ),
                        ),
                        _buildSocialButton(
                          context,
                          Icons.work,
                          'LinkedIn',
                          () => _launchLinkedIn(),
                        ),
                        SizedBox(
                          width: ResponsiveHelper.getResponsiveSpacing(
                            context,
                            mobile: 16.w,
                            tablet: 20.w,
                            desktop: 24.w,
                          ),
                        ),
                        _buildSocialButton(
                          context,
                          Icons.alternate_email,
                          'Twitter',
                          () => _launchTwitter(),
                        ),
                      ],
                    ),
                  ],
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

              // Divider
              FadeInUp(
                duration: const Duration(milliseconds: 1400),
                delay: const Duration(milliseconds: 400),
                child: Container(
                  height: 1.h,
                  width: double.infinity,
                  color: AppColor.whiteColor(context).withOpacity(0.2),
                ),
              ),

              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(
                  context,
                  mobile: 30.h,
                  tablet: 40.h,
                  desktop: 50.h,
                ),
              ),

              // Copyright
              FadeInUp(
                duration: const Duration(milliseconds: 1600),
                delay: const Duration(milliseconds: 600),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '© 2024 Ibrahim Elnemr. All rights reserved.',
                      style: AppTextStyle.text12RWhite(context).copyWith(
                        fontSize: 12.sp,
                        color: AppColor.whiteColor(context).withOpacity(0.7),
                      ),
                    ),
                    if (!isMobile)
                      Text(
                        'Made with ❤️ using Flutter',
                        style: AppTextStyle.text12RWhite(context).copyWith(
                          fontSize: 12.sp,
                          color: AppColor.whiteColor(context).withOpacity(0.7),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactButton(
    BuildContext context,
    String text,
    IconData icon,
    VoidCallback onTap,
  ) {
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
        color: AppColor.whiteColor(context),
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor(context).withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25.r),
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18.w, color: AppColor.mainAppColor(context)),
              SizedBox(width: 8.w),
              Text(
                text,
                style: AppTextStyle.text14MDark(context).copyWith(
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return Container(
      width: ResponsiveHelper.getResponsiveValue(
        context,
        mobile: 50.w,
        tablet: 60.w,
        desktop: 70.w,
      ),
      height: ResponsiveHelper.getResponsiveValue(
        context,
        mobile: 50.w,
        tablet: 60.w,
        desktop: 70.w,
      ),
      decoration: BoxDecoration(
        color: AppColor.whiteColor(context).withOpacity(0.1),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: AppColor.whiteColor(context).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.r),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24.w, color: AppColor.whiteColor(context)),
              SizedBox(height: 4.h),
              Text(
                label,
                style: AppTextStyle.text10RWhite(context).copyWith(
                  fontSize: 10.sp,
                  color: AppColor.whiteColor(context).withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'ibrahim.elnemr@example.com',
      query: 'subject=Portfolio Contact&body=Hello Ibrahim,',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  void _launchResume() async {
    // Replace with your actual resume URL
    final Uri resumeUri = Uri.parse('https://example.com/resume.pdf');
    if (await canLaunchUrl(resumeUri)) {
      await launchUrl(resumeUri, mode: LaunchMode.externalApplication);
    }
  }

  void _launchGitHub() async {
    final Uri githubUri = Uri.parse('https://github.com/ibrahimelnemr');
    if (await canLaunchUrl(githubUri)) {
      await launchUrl(githubUri, mode: LaunchMode.externalApplication);
    }
  }

  void _launchLinkedIn() async {
    final Uri linkedinUri = Uri.parse('https://linkedin.com/in/ibrahimelnemr');
    if (await canLaunchUrl(linkedinUri)) {
      await launchUrl(linkedinUri, mode: LaunchMode.externalApplication);
    }
  }

  void _launchTwitter() async {
    final Uri twitterUri = Uri.parse('https://twitter.com/ibrahimelnemr');
    if (await canLaunchUrl(twitterUri)) {
      await launchUrl(twitterUri, mode: LaunchMode.externalApplication);
    }
  }
}
