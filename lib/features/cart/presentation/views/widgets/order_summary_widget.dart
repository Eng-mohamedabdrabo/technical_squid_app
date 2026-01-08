import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:technical_squid_app/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).total,
                style: AppStyles.textStyle20SemiBold.copyWith(
                  color: ColorManager.textDark,
                ),
              ),
              const SizedBox(height: 20),

              _buildRow(
                context,
                S.of(context).step1,
                '${state.totalServicePrice} ${S.of(context).sar}',
              ),
              const SizedBox(height: 10),
              _buildRow(
                context,
                S.of(context).additions,
                '${state.totalSparePartsPrice} ${S.of(context).sar}',
              ),
              const Divider(height: 30),

              _buildRow(
                context,
                S.of(context).total,
                '${state.finalTotal.toStringAsFixed(2)} ${S.of(context).sar}',
                isBold: true,
              ),
              const SizedBox(height: 5),
              Text(
                S.of(context).vatIncluded,
                style: AppStyles.textStyle12Regular.copyWith(
                  color: ColorManager.textSecondary,
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      ColorManager.accent,
                      Color(0xFFF2D59B), // Lighter gold
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.accent.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (state.currentStep == 3) {
                      context.read<CartCubit>().confirmOrder();
                    } else {
                      context.read<CartCubit>().nextStep();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _getButtonLabel(context, state.currentStep),
                    style: AppStyles.textStyle16Medium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Center(
                child: TextButton(
                  onPressed: () {
                    if (state.currentStep == 0) {
                      // Use context.go to clear stack and go to Home
                      context.go(AppRouter.kHomeView);
                    } else {
                      context.read<CartCubit>().prevStep();
                    }
                  },
                  child: Text(
                    _getBackLabel(context, state.currentStep),
                    style: AppStyles.textStyle14Regular.copyWith(
                      color: ColorManager.textSecondary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getButtonLabel(BuildContext context, int step) {
    if (step == 3) return S.of(context).confirmOrder;
    if (step == 2) return S.of(context).payment; // Go to pay
    if (step == 1) return S.of(context).review; // Go to review
    return S.of(context).checkout;
  }

  String _getBackLabel(BuildContext context, int step) {
    if (step == 0) return S.of(context).continueShopping;
    if (step == 1)
      return '${S.of(context).backTo} ${S.of(context).cart}'; // Back to Cart
    if (step == 2)
      return '${S.of(context).backTo} ${S.of(context).compatibility}'; // Back to Compatibility
    if (step == 3)
      return '${S.of(context).backTo} ${S.of(context).review}'; // Back to Review
    return S.of(context).back;
  }

  Widget _buildRow(
    BuildContext context,
    String label,
    String value, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold
              ? AppStyles.textStyle16Medium.copyWith(
                  fontWeight: FontWeight.bold,
                )
              : AppStyles.textStyle14Regular.copyWith(
                  color: ColorManager.textSecondary,
                ),
        ),
        Text(
          value,
          style: isBold
              ? AppStyles.textStyle16Medium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primary,
                )
              : AppStyles.textStyle14Regular.copyWith(
                  color: ColorManager.textDark,
                ),
        ),
      ],
    );
  }
}
