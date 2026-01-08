import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/adaptive_layout.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:technical_squid_app/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:technical_squid_app/features/cart/presentation/views/widgets/custom_cart_progress_bar.dart';
import 'package:technical_squid_app/features/cart/presentation/views/widgets/order_summary_widget.dart';
import 'package:technical_squid_app/features/cart/presentation/views/widgets/step_1_cart_items.dart';
import 'package:technical_squid_app/features/cart/presentation/views/widgets/step_2_compatibility.dart';
import 'package:technical_squid_app/features/cart/presentation/views/widgets/step_3_review.dart';
import 'package:technical_squid_app/features/cart/presentation/views/widgets/step_4_payment.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return PopScope(
                canPop: false,
                child: Scaffold(
                  backgroundColor: ColorManager.lightBackground,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    title: Text(
                      S.of(context).cart,
                      style: AppStyles.textStyle24Bold.copyWith(
                        color: ColorManager.textDark,
                      ),
                    ),
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: ColorManager.textDark,
                      ),
                      onPressed: () {
                        if (state.currentStep == 0) {
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            context.go(AppRouter.kHomeView);
                          }
                        } else {
                          context.read<CartCubit>().prevStep();
                        }
                      },
                    ),
                  ),
                  body: AdaptiveLayout(
                    mobileLayout: (context) => const _CartMobileLayout(),
                    tabletLayout: (context) => const _CartTabletLayout(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _CartMobileLayout extends StatelessWidget {
  const _CartMobileLayout();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              CustomCartProgressBar(currentStep: state.currentStep),
              const SizedBox(height: 16),
              _buildStepContent(state.currentStep),
              const SizedBox(height: 20),
              // Summary is persistent in mobile flow as per request ("Summary container alone... then button")
              // Actually Step 4 covers the button action, but OrderSummaryWidget is the "Summary Container".
              // The user said "Summary container alone... handle it... button below it".
              // I integrated the button INSIDE OrderSummaryWidget.
              if (!state.isOrderConfirmed) const OrderSummaryWidget(),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return const Step1CartItems();
      case 1:
        return const Step2Compatibility();
      case 2:
        return const Step3Review();
      case 3:
        return const Step4Payment();
      default:
        return const SizedBox.shrink();
    }
  }
}

class _CartTabletLayout extends StatelessWidget {
  const _CartTabletLayout();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: Steps & Content
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomCartProgressBar(currentStep: state.currentStep),
                      const SizedBox(height: 24),
                      _buildStepContent(state.currentStep),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 24),
              // Right: Summary
              if (!state.isOrderConfirmed)
                const Expanded(flex: 1, child: OrderSummaryWidget()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStepContent(int step) {
    // Reuse logic
    switch (step) {
      case 0:
        return const Step1CartItems();
      case 1:
        return const Step2Compatibility();
      case 2:
        return const Step3Review();
      case 3:
        return const Step4Payment();
      default:
        return const SizedBox.shrink();
    }
  }
}
