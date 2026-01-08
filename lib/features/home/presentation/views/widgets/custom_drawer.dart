import 'package:flutter/material.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/widgets/custom_language_selector.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header / Logo Area (Optional)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              title: Text(
                S.of(context).menu,
                style: AppStyles.textStyle24Bold.copyWith(
                  color: ColorManager.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Menu Items
            _buildMenuItem(
              context,
              S.of(context).myAccount,
              Icons.person_outline,
              () {
                Navigator.pop(context); // Close Drawer
                _smartNavigate(context, AppRouter.kMyAccountView);
              },
            ),
            _buildMenuItem(
              context,
              S.of(context).aboutUs,
              Icons.info_outline,
              () {
                Navigator.pop(context); // Close Drawer
                _smartNavigate(context, AppRouter.kAboutUsView);
              },
            ),
            _buildMenuItem(
              context,
              S.of(context).subscriptionRequest,
              Icons.business_center_outlined,
              () {
                Navigator.pop(context); // Close Drawer
                _smartNavigate(context, AppRouter.kCompanySubscriptionView);
              },
            ),
            _buildMenuItem(
              context,
              S.of(context).packagesTitle,
              Icons.stars,
              () {
                Navigator.pop(context); // Close Drawer
                _smartNavigate(context, AppRouter.kPackagesView);
              },
            ),
            _buildMenuItem(
              context,
              S.of(context).myOrders,
              Icons.receipt_long,
              () {
                Navigator.pop(context); // Close Drawer
                _smartNavigate(context, AppRouter.kOrdersView);
              },
            ),

            const Spacer(),

            // Auth Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  _buildAuthButton(
                    context,
                    S.of(context).login,
                    ColorManager.primary,
                    Icons.login,
                    () {
                      context.go(AppRouter.kLoginView);
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildAuthButton(
                    context,
                    S.of(context).createAccount,
                    ColorManager.accent, // Gold for Create Account
                    Icons.person_add_alt,
                    () {
                      context.go(AppRouter.kSignupView);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Divider(height: 1),
            const SizedBox(height: 24),

            // Language Selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).changeLanguage,
                    style: AppStyles.textStyle16Medium.copyWith(
                      color: ColorManager.textLight,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const CustomLanguageSelector(),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthButton(
    BuildContext context,
    String title,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white, size: 20),
        label: Text(
          title,
          style: AppStyles.textStyle16Medium.copyWith(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        onPressed: onTap,
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Icon(icon, color: ColorManager.primary, size: 24),
      title: Text(
        title,
        style: AppStyles.textStyle16Medium.copyWith(
          color: ColorManager.primary,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      hoverColor: ColorManager.accent.withValues(alpha: 0.1),
    );
  }

  void _smartNavigate(BuildContext context, String route) {
    if (route == AppRouter.kHomeView) {
      context.go(AppRouter.kHomeView);
      return;
    }

    // Simple heuristic: If we are deep (e.g. Orders), replacing keeps stack small.
    // If we are at Home, push.
    // Since we don't have easy synchronous access to current location state in this context
    // without some boilerplate, we can try a safer approach:
    // "go" to route would make it root-like.
    // But we want "Back" -> Home.
    // The previous implementation used push for everything -> Stack grew.
    // We want to avoid stack growth.
    // If we use pushReplacement, we assume we are allowed to replace.
    // If we are at Home, replacing Home with Orders means Back exits app! Bad.

    // Refined Logic using GoRouter location check:
    final String location = GoRouterState.of(context).uri.toString();
    if (location == AppRouter.kHomeView || location == '/') {
      context.push(route);
    } else {
      context.pushReplacement(route);
    }
  }
}
