import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:technical_squid_app/features/packages/presentation/views/widgets/packages_view_body.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: ColorManager.lightBackground,
        appBar: AppBar(
          title: Text(
            S.of(context).packagesTitle,
            style: AppStyles.textStyle20SemiBold.copyWith(
              color: ColorManager.textDark,
            ),
          ),
          centerTitle: true,
          backgroundColor: ColorManager.lightBackground,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: ColorManager.textDark),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go((AppRouter.kHomeView));
              }
            },
          ),
        ),
        body: const PackagesViewBody(),
      ),
    );
  }
}
