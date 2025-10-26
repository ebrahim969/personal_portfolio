import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
      decoration: BoxDecoration(color: AppColor.whiteColor(context)),
      child: Column(
        children: [
          // Section Title
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: Text(
              'My Experience',
              style: AppTextStyle.text20SSecond(context).copyWith(
                fontSize: isMobile ? 28.sp : 36.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.darkTextColor(context),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          FadeInUp(
            duration: const Duration(milliseconds: 1200),
            delay: const Duration(milliseconds: 200),
            child: Container(
              width: 80.w,
              height: 4.h,
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

          SizedBox(height: 60.h),

          // Timeline
          Column(
            children: [
              _buildTimelineItem(
                context,
                'Senior Flutter Developer',
                'Tech Solutions Inc.',
                '2022 - Present',
                'Leading the development of mobile applications using Flutter. Mentoring junior developers and implementing best practices for scalable mobile app development.',
                [
                  'Led development of 5+ mobile applications',
                  'Improved app performance by 40%',
                  'Mentored 3 junior developers',
                  'Implemented CI/CD pipelines',
                ],
                0,
                isFirst: true,
                isLast: false,
              ),

              _buildTimelineItem(
                context,
                'Flutter Developer',
                'Digital Innovations Ltd.',
                '2021 - 2022',
                'Developed cross-platform mobile applications using Flutter and Dart. Collaborated with design and backend teams to deliver high-quality user experiences.',
                [
                  'Developed 3 cross-platform apps',
                  'Integrated REST APIs and Firebase',
                  'Collaborated with UI/UX designers',
                  'Maintained 95% code coverage',
                ],
                1,
                isFirst: false,
                isLast: false,
              ),

              _buildTimelineItem(
                context,
                'Junior Mobile Developer',
                'StartupXYZ',
                '2020 - 2021',
                'Started my journey in mobile development, learning Flutter and building my first mobile applications. Gained experience in full-stack development.',
                [
                  'Built first mobile app from scratch',
                  'Learned Flutter and Dart fundamentals',
                  'Worked with Firebase backend',
                  'Participated in agile development',
                ],
                2,
                isFirst: false,
                isLast: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    String title,
    String company,
    String period,
    String description,
    List<String> achievements,
    int index, {
    required bool isFirst,
    required bool isLast,
  }) {
    final isMobile = MediaQuery.of(context).size.width <= 768;

    return FadeInLeft(
      duration: Duration(milliseconds: 1000 + (index * 300)),
      child: TimelineTile(
        alignment: TimelineAlign.start,
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
          width: 20.w,
          height: 20.w,
          indicator: Container(
            decoration: BoxDecoration(
              color: AppColor.mainAppColor(context),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColor.mainAppColor(context).withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              Icons.work,
              size: 12.w,
              color: AppColor.whiteColor(context),
            ),
          ),
        ),
        beforeLineStyle: LineStyle(
          color: AppColor.mainAppColor(context).withOpacity(0.3),
          thickness: 2,
        ),
        afterLineStyle: LineStyle(
          color: AppColor.mainAppColor(context).withOpacity(0.3),
          thickness: 2,
        ),
        endChild: Container(
          margin: EdgeInsets.only(left: 20.w, bottom: isLast ? 0 : 40.h),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Period
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyle.text16MSecond(context).copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.darkTextColor(context),
                      ),
                    ),
                  ),
                  if (!isMobile)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.mainAppColor(context).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        period,
                        style: AppTextStyle.text10MMain(context).copyWith(
                          fontSize: 10.sp,
                          color: AppColor.mainAppColor(context),
                        ),
                      ),
                    ),
                ],
              ),

              if (isMobile) SizedBox(height: 8.h),

              // Company
              Text(
                company,
                style: AppTextStyle.text14RDark(context).copyWith(
                  fontSize: 14.sp,
                  color: AppColor.mainAppColor(context),
                  fontWeight: FontWeight.w600,
                ),
              ),

              if (isMobile) ...[
                SizedBox(height: 8.h),
                Text(
                  period,
                  style: AppTextStyle.text12RGrey(
                    context,
                  ).copyWith(fontSize: 12.sp),
                ),
              ],

              SizedBox(height: 16.h),

              // Description
              Text(
                description,
                style: AppTextStyle.text12RDark(context).copyWith(
                  fontSize: 14.sp,
                  color: AppColor.greyColor(context),
                  height: 1.6,
                ),
              ),

              SizedBox(height: 20.h),

              // Achievements
              Text(
                'Key Achievements:',
                style: AppTextStyle.text12MDark(context).copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.darkTextColor(context),
                ),
              ),

              SizedBox(height: 12.h),

              ...achievements.map(
                (achievement) => Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h, right: 8.w),
                        width: 4.w,
                        height: 4.w,
                        decoration: BoxDecoration(
                          color: AppColor.mainAppColor(context),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          achievement,
                          style: AppTextStyle.text12RDark(context).copyWith(
                            fontSize: 12.sp,
                            color: AppColor.greyColor(context),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
