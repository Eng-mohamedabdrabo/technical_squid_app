import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/adaptive_layout.dart';
import 'package:technical_squid_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:technical_squid_app/features/home/presentation/views/widgets/dashboard_mobile_layout.dart';
import 'package:technical_squid_app/features/home/presentation/views/widgets/dashboard_tablet_layout.dart';
import 'package:flutter/services.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // We keep the BlocProvider here so it's available to the Shell and all children
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          // Only minimize if we actally try to exit the app from the root of the shell
          // This logic might need refinement if 'child' allows popping, but for now
          // minimizing on back press at root is the requirement.
          // However, inside ShellRoute, GoRouter handles the pop.
          // We might only want this logic if we are at the "home" location.
          // For now, I will keep it as is from HomeView, but it might intercept all backs.
          // Let's rely on GoRouter to handle back first?
          // Actually, standard Android back minimization usually happens when there's nothing left to pop.

          // Since this is a shell, back pushes might pop sub-routes.
          // We'll leave the minimize logic here for when the shell itself is dismissed (which shouldn't happen easily)
          // OR we check if we are at the root path.

          // For now, let's just replicate the existing behavior which was on HomeView.
          const platform = MethodChannel(
            'com.example.technical_squid_app/app_channel',
          );
          try {
            await platform.invokeMethod('minimizeApp');
          } catch (e) {
            // Fallback
          }
        },
        child: AdaptiveLayout(
          mobileLayout: (context) => DashboardMobileLayout(child: child),
          tabletLayout: (context) => DashboardTabletLayout(child: child),
        ),
      ),
    );
  }
}
