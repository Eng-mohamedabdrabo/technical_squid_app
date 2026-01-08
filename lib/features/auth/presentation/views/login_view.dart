import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:technical_squid_app/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: ColorManager.lightBackground,
          body: const SafeArea(child: LoginViewBody()),
        ),
      ),
    );
  }
}
