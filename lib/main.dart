import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:technical_squid_app/core/localization/locale_cubit.dart';
import 'package:technical_squid_app/core/localization/locale_state.dart';
import 'package:technical_squid_app/core/utils/theme_manager.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';
import 'package:technical_squid_app/generated/l10n.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (_) {
        return BlocProvider(
          create: (_) => LocaleCubit(),
          child: const TechnicalSquid(),
        );
      },
    ),
  );
}

class TechnicalSquid extends StatelessWidget {
  const TechnicalSquid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,

          locale: state.locale,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          builder: DevicePreview.appBuilder,

          theme: ThemeManager.getAppTheme(),

          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
