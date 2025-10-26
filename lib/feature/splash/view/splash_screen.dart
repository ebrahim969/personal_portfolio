import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startSplashSequence();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );
  }

  void _startSplashSequence() async {
    // Start fade animation
    _fadeController.forward();

    // Wait a bit then start scale animation
    await Future.delayed(const Duration(milliseconds: 500));
    _scaleController.forward();

    // Wait a bit then start slide animation
    await Future.delayed(const Duration(milliseconds: 300));
    _slideController.forward();

    // Wait for all animations to complete then navigate
    await Future.delayed(const Duration(milliseconds: 2000));
    if (mounted) {
      context.go(RoutesName.homeScreen);
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.scaffoldColor(context),
              AppColor.mainAppColor(context).withOpacity(0.8),
              AppColor.secondAppColor(context),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Avatar
              FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColor.whiteColor(context),
                          AppColor.mainAppColor(context).withOpacity(0.3),
                          AppColor.secondAppColor(context).withOpacity(0.1),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.mainAppColor(
                            context,
                          ).withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
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
              ),

              SizedBox(height: 40.h),

              // Animated Name
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      Text(
                        'Hello, I am',
                        style: AppTextStyle.luckiestGuyStyle(
                          context,
                          color: AppColor.whiteColor(context).withOpacity(0.9),
                        ).copyWith(fontSize: 24.sp),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Ibrahim Elnemr',
                        style:
                            AppTextStyle.luckiestGuyStyle(
                              context,
                              color: AppColor.mainAppColor(context),
                            ).copyWith(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: AppColor.whiteColor(
                                    context,
                                  ).withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Flutter Developer & UI/UX Designer',
                        style: AppTextStyle.text16MWhite(
                          context,
                        ).copyWith(fontSize: 16.sp, letterSpacing: 1.2),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 60.h),

              // Loading Animation
              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColor.mainAppColor(context),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Loading...',
                        style: AppTextStyle.text12RWhite(
                          context,
                        ).copyWith(fontSize: 14.sp, letterSpacing: 1.0),
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
