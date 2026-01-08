import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:technical_squid_app/features/packages/presentation/views/widgets/package_card_widget.dart';

class PackagesViewBody extends StatelessWidget {
  const PackagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                // 1. Refined Header
                Text(
                  S.of(context).premiumPackages,
                  style: AppStyles.textStyle24Bold.copyWith(
                    color: ColorManager.accent,
                    fontSize: 28,
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  S.of(context).choosePackage,
                  style: AppStyles.textStyle16Medium.copyWith(
                    color: ColorManager.textSecondary,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),

                // Gradient Divider Line
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 100,
                    height: 4,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.transparent,
                          ColorManager.accent,
                          Colors.transparent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // 2. Responsive Packages List/Grid
                if (isTablet)
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.85,
                    children: _buildPackageCards(context),
                  )
                else
                  Column(children: _buildPackageCards(context)),

                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildPackageCards(BuildContext context) {
    return [
      PackageCardWidget(
        packageName: 'Silver Package',
        price: '199',
        period: S.of(context).monthly,
        features: const [
          'Unlimited Car Wash',
          '1 Oil Change',
          'Free Inspection',
        ],
        onSubscribe: () {},
      ),
      PackageCardWidget(
        packageName: 'Gold Package',
        price: '399',
        period: S.of(context).monthly,
        isSubscribed: true,
        features: const [
          'Unlimited Car Wash',
          'Unlimited Oil Change',
          'Priority & VIP Support',
          'Free Towing Service',
        ],
        onSubscribe: () {},
      ),
      PackageCardWidget(
        packageName: 'Platinum Package',
        price: '999',
        period: S.of(context).yearly,
        features: const [
          'All Gold Features',
          'Full Engine Checkup',
          'Luxury Polishing',
          '24/7 Roadside Assistance',
        ],
        onSubscribe: () {},
      ),
    ];
  }
}
