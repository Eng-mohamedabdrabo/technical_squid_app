import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/assets.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';

import 'package:technical_squid_app/generated/l10n.dart';
import 'package:technical_squid_app/features/static/presentation/views/widgets/add_car_bottom_sheet.dart';
import 'package:technical_squid_app/features/static/presentation/views/widgets/car_details_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Area (Scrolls with the page)
            Stack(
              clipBehavior: Clip.none,
              children: [
                // 1. Gradient Background
                Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [
                        ColorManager.primary,
                        Color(0xFF1A1A2E), // Darker shade for gradient
                      ],
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),

                // 2. Back Button & Title
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Back Button
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  } else {
                                    context.go(AppRouter.kHomeView);
                                  }
                                },
                              ),
                            ),
                            const Spacer(),
                            // Title
                            Text(
                              S.of(context).myAccount,
                              style: AppStyles.textStyle24Bold.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(width: 40), // Balance
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 3. Profile Image (Overlapping downwards)
                Positioned(
                  bottom: -65,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        image: const DecorationImage(
                          image: AssetImage(Assets.service),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 80),

            // User Name
            Text(
              'Mohamed Ahmed',
              style: AppStyles.textStyle24Bold.copyWith(
                color: ColorManager.textDark,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 16),

            // Phone Number (Special Handling)
            _buildPhoneItem(),
            const SizedBox(height: 8),
            // Email
            _buildInfoItem(Icons.email, 'mohamed@example.com'),

            const SizedBox(height: 40),

            // My Cars Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    decoration: BoxDecoration(
                      color: ColorManager.accent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'My Cars',
                    style: AppStyles.textStyle24Bold.copyWith(
                      fontSize: 20,
                      color: ColorManager.textDark,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const AddCarBottomSheet(),
                        );
                      },
                      icon: const Icon(Icons.add, color: ColorManager.primary),
                      tooltip: S.of(context).addCar,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Cars List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildPremiumCarItem(
                    context,
                    'Toyota Camry',
                    '2022',
                    Icons.directions_car,
                  ),
                  _buildPremiumCarItem(
                    context,
                    'Ford Explorer',
                    '2020',
                    Icons.local_shipping_outlined,
                  ),
                  _buildPremiumCarItem(
                    context,
                    'Hyundai Sonata',
                    '2023',
                    Icons.directions_car_filled_outlined,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.phone, size: 20, color: ColorManager.primary),
        const SizedBox(width: 8),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            children: [
              Text(
                '+966',
                style: AppStyles.textStyle16Medium.copyWith(
                  color: ColorManager.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'xxxxx',
                style: AppStyles.textStyle16Medium.copyWith(
                  color: ColorManager.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20, color: ColorManager.primary),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildPremiumCarItem(
    BuildContext context,
    String name,
    String year,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE0E0E0).withValues(alpha: 0.5),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => CarDetailsDialog(
                carName: name,
                carModel: year,
                plateNumber: 'ABC 1234', // Mocked for now as per plan
                color: 'White', // Mocked for now
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [ColorManager.primary, Color(0xFF3F51B5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.primary.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppStyles.textStyle16Medium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.textDark,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Model $year',
                        style: AppStyles.textStyle12Regular.copyWith(
                          color: ColorManager.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorManager.lightBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
