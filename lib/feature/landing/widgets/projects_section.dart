import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/utils/responsive_helper.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
                AppColor.scaffoldColor(context).withOpacity(0.1),
                AppColor.whiteColor(context),
              ],
            ),
          ),
          child: Column(
            children: [
              // Section Title
              FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  'My Projects',
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

              // Projects Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  if (isMobile) {
                    return Column(
                      children: [
                        _buildProjectCard(
                          context,
                          'E-Commerce App',
                          'A full-featured e-commerce mobile application built with Flutter and Firebase. Features include user authentication, product catalog, shopping cart, and payment integration.',
                          'Flutter, Firebase, Stripe',
                          'assets/images/project1.png',
                          0,
                        ),
                        SizedBox(height: 24.h),
                        _buildProjectCard(
                          context,
                          'Task Management App',
                          'A collaborative task management application with real-time updates, team collaboration features, and project tracking capabilities.',
                          'Flutter, Firebase, WebRTC',
                          'assets/images/project2.png',
                          1,
                        ),
                        SizedBox(height: 24.h),
                        _buildProjectCard(
                          context,
                          'Weather App',
                          'A beautiful weather application with location-based forecasts, interactive maps, and detailed weather analytics.',
                          'Flutter, OpenWeather API, Maps',
                          'assets/images/project3.png',
                          2,
                        ),
                      ],
                    );
                  } else {
                    // Calculate optimal columns based on available width
                    final availableWidth = constraints.maxWidth;
                    final cardWidth = ResponsiveHelper.getResponsiveValue(
                      context,
                      mobile: 300.w,
                      tablet: 350.w,
                      desktop: 400.w,
                    );
                    final spacing = ResponsiveHelper.getResponsiveSpacing(
                      context,
                      mobile: 16.w,
                      tablet: 20.w,
                      desktop: 24.w,
                    );

                    int columns = (availableWidth / (cardWidth + spacing))
                        .floor();
                    columns = columns.clamp(1, 3); // Limit to max 3 columns

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: spacing,
                        mainAxisSpacing: ResponsiveHelper.getResponsiveSpacing(
                          context,
                          mobile: 16.h,
                          tablet: 20.h,
                          desktop: 24.h,
                        ),
                        childAspectRatio: ResponsiveHelper.getResponsiveValue(
                          context,
                          mobile: 1.0,
                          tablet: 1.2,
                          desktop: 1.0,
                        ),
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        final projects = [
                          {
                            'title': 'E-Commerce App',
                            'description':
                                'A full-featured e-commerce mobile application built with Flutter and Firebase.',
                            'tech': 'Flutter, Firebase, Stripe',
                            'image': 'assets/images/project1.png',
                          },
                          {
                            'title': 'Task Management App',
                            'description':
                                'A collaborative task management application with real-time updates.',
                            'tech': 'Flutter, Firebase, WebRTC',
                            'image': 'assets/images/project2.png',
                          },
                          {
                            'title': 'Weather App',
                            'description':
                                'A beautiful weather application with location-based forecasts.',
                            'tech': 'Flutter, OpenWeather API, Maps',
                            'image': 'assets/images/project3.png',
                          },
                          {
                            'title': 'Social Media App',
                            'description':
                                'A modern social media platform with real-time messaging and content sharing.',
                            'tech': 'Flutter, Firebase, WebSocket',
                            'image': 'assets/images/project4.png',
                          },
                          {
                            'title': 'Fitness Tracker',
                            'description':
                                'A comprehensive fitness tracking application with workout plans and progress monitoring.',
                            'tech': 'Flutter, Health APIs, Charts',
                            'image': 'assets/images/project5.png',
                          },
                          {
                            'title': 'Food Delivery App',
                            'description':
                                'A food delivery platform with restaurant listings, ordering, and tracking.',
                            'tech': 'Flutter, Google Maps, Payment',
                            'image': 'assets/images/project6.png',
                          },
                        ];

                        return _buildProjectCard(
                          context,
                          projects[index]['title']!,
                          projects[index]['description']!,
                          projects[index]['tech']!,
                          projects[index]['image']!,
                          index,
                        );
                      },
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

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String description,
    String tech,
    String imagePath,
    int index,
  ) {
    return FadeInUp(
      duration: Duration(milliseconds: 1000 + (index * 200)),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.whiteColor(context),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor(context).withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColor.mainAppColor(context).withOpacity(0.1),
                    AppColor.secondAppColor(context).withOpacity(0.1),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.phone_android,
                  size: 60.w,
                  color: AppColor.mainAppColor(context).withOpacity(0.3),
                ),
              ),
            ),

            // Project Content
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.text16MSecond(context).copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.darkTextColor(context),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    description,
                    style: AppTextStyle.text12RDark(context).copyWith(
                      fontSize: 14.sp,
                      color: AppColor.greyColor(context),
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 16.h),

                  // Tech Stack
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: tech.split(', ').map((techItem) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.mainAppColor(
                            context,
                          ).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          techItem,
                          style: AppTextStyle.text10MMain(context).copyWith(
                            fontSize: 10.sp,
                            color: AppColor.mainAppColor(context),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 20.h),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColor.mainAppColor(context),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8.r),
                              onTap: () {
                                // View project details
                              },
                              child: Center(
                                child: Text(
                                  'View Details',
                                  style: AppTextStyle.text12RWhite(context)
                                      .copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.mainAppColor(context),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8.r),
                            onTap: () {
                              // View live demo
                            },
                            child: Icon(
                              Icons.launch,
                              size: 18.w,
                              color: AppColor.mainAppColor(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
