import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:technical_squid_app/features/orders/presentation/views/widgets/order_stage_section.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      appBar: AppBar(
        title: Text(
          S.of(context).orderDetails,
          style: AppStyles.textStyle20SemiBold.copyWith(
            color: ColorManager.textDark,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorManager.iconDark),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Info Card (Dark Theme)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.primary.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).addService, // Mock Name
                              style: AppStyles.textStyle18SemiBold.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Order #12345',
                              style: AppStyles.textStyle14Regular.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Text(
                            '150 ${S.of(context).sar}',
                            style: AppStyles.textStyle18SemiBold.copyWith(
                              color: ColorManager.accent,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Stages Label
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Order Progress', // Could be localized but using simple label for now
                  style: AppStyles.textStyle18SemiBold.copyWith(
                    color: ColorManager.textDark,
                  ),
                ),
              ),

              // 4 Sections
              OrderStageSection(title: S.of(context).vehicleReceivingImages),
              const SizedBox(height: 20),
              OrderStageSection(title: S.of(context).repairProcessImages),
              const SizedBox(height: 20),
              OrderStageSection(title: S.of(context).vehiclePickupImages),
              const SizedBox(height: 20),
              OrderStageSection(title: S.of(context).afterDeliveryImages),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
