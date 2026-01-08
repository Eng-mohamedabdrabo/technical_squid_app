import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/features/splash/presentation/views/splash_view.dart';
import 'package:technical_squid_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:technical_squid_app/features/home/presentation/views/home_view.dart';
import 'package:technical_squid_app/features/auth/presentation/views/login_view.dart';
import 'package:technical_squid_app/features/auth/presentation/views/signup_view.dart';
import 'package:technical_squid_app/features/auth/presentation/views/verification_view.dart';
import 'package:technical_squid_app/features/static/presentation/views/company_subscription_view.dart';
import 'package:technical_squid_app/features/cart/presentation/views/cart_view.dart';
import 'package:technical_squid_app/features/static/presentation/views/my_account_view.dart';
import 'package:technical_squid_app/features/orders/presentation/views/orders_view.dart';
import 'package:technical_squid_app/features/packages/presentation/views/packages_view.dart';
import 'package:technical_squid_app/features/static/presentation/views/about_us_view.dart';
import 'package:technical_squid_app/features/home/presentation/views/widgets/main_shell.dart';

abstract class AppRouter {
  static const kOnboardingView = '/onboarding';
  static const kHomeView = '/home';
  static const kLoginView = '/login';
  static const kSignupView = '/signup';
  static const kVerificationView = '/verification';
  static const kCompanySubscriptionView = '/company-subscription';
  static const kCartView = '/cart';
  static const kMyAccountView = '/my-account';
  static const kOrdersView = '/orders';
  static const kPackagesView = '/packages';
  static const kAboutUsView = '/about-us';

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      // Entry & Auth Flows (Outside Shell)
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kVerificationView,
        builder: (context, state) => const VerificationView(),
      ),
      GoRoute(
        path: kCompanySubscriptionView,
        builder: (context, state) => const CompanySubscriptionView(),
      ),

      // Main App Shell
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: kHomeView,
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: kCartView,
            builder: (context, state) => const CartView(),
          ),
          GoRoute(
            path: kMyAccountView,
            builder: (context, state) => const MyAccountView(),
          ),
          GoRoute(
            path: kOrdersView,
            builder: (context, state) => const OrdersView(),
          ),
          GoRoute(
            path: kPackagesView,
            builder: (context, state) => const PackagesView(),
          ),
          GoRoute(
            path: kAboutUsView,
            builder: (context, state) => const AboutUsView(),
          ),
        ],
      ),
    ],
    // redirect: (context, state) {
    //   // Temporary Redirect Logic - Replace with real Auth Logic later
    //   // 1. Check if user is logged in (Mocked)
    //   const bool isLoggedIn = true;
    //   // 2. Check if onboarding is complete (Mocked)
    //   const bool isOnboardingComplete = true;

    //   final String location = state.uri.toString();

    //   // If not onboarding complete, force Onboarding (unless already there)
    //   if (!isOnboardingComplete && location != kOnboardingView) {
    //     return kOnboardingView;
    //   }

    //   // If onboarding complete but on Onboarding page, go to Welcome/Login
    //   if (isOnboardingComplete && location == kOnboardingView) {
    //     return isLoggedIn ? kHomeView : kLoginView;
    //   }

    //   // If not logged in, prevent access to Shell (Home, Orders, etc.)
    //   // Allowed public routes: Login, Signup, Verification, Splash
    //   final bool isPublicRoute =
    //       location == '/' ||
    //       location == kLoginView ||
    //       location == kSignupView ||
    //       location == kVerificationView ||
    //       location == kOnboardingView;

    //   if (!isLoggedIn && !isPublicRoute) {
    //     return kLoginView;
    //   }

    //   // If logged in, prevent access to Login/Signup/Verification
    //   // redirect to Home
    //   if (isLoggedIn &&
    //       (location == kLoginView ||
    //           location == kSignupView ||
    //           location == kVerificationView)) {
    //     return kHomeView;
    //   }

    //   return null; // No redirect
    // },
  );
}
