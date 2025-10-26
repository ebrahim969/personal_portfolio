import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          builder: BotToastInit(),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
