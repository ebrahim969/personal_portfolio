import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/routes/app_router.dart';
import 'core/theme/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:country_picker/country_picker.dart';

class PersonalPortfolio extends StatefulWidget {
  const PersonalPortfolio({super.key});

  @override
  State<PersonalPortfolio> createState() => _PersonalPortfolioState();
}

class _PersonalPortfolioState extends State<PersonalPortfolio> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          localizationsDelegates: [
            ...context.localizationDelegates,
            CountryLocalizations.delegate,
          ],
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: appThemeData(context),
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 500, name: MOBILE),
              const Breakpoint(start: 501, end: 1000, name: TABLET),
              const Breakpoint(
                start: 1001,
                end: double.infinity,
                name: DESKTOP,
              ),
            ],
          ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
