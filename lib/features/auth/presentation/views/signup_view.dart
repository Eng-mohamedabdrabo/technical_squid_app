import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:technical_squid_app/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: ColorManager.lightBackground,
          body: const SafeArea(child: SignupViewBody()),
        ),
      ),
    );
  }
}
