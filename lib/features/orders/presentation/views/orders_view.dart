import 'package:flutter/material.dart';

import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:technical_squid_app/features/orders/presentation/views/widgets/order_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/features/orders/presentation/manager/orders_cubit/orders_cubit.dart';

import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(),
      child: Scaffold(
        backgroundColor: ColorManager.lightBackground,
        appBar: AppBar(
          title: Text(
            S.of(context).myOrders,
            style: AppStyles.textStyle20SemiBold.copyWith(
              color: ColorManager.textDark,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: ColorManager.primary),
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                context.pop();
              } else {
                context.go(AppRouter.kHomeView);
              }
            },
          ),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                if (state is OrdersLoaded) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    itemCount: state.orders.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return OrderCard(index: state.orders[index]);
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(color: ColorManager.primary),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
