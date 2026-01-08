import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/widgets/custom_header.dart';
import 'package:technical_squid_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeView is now just the content of the dashboard
    return SafeArea(
      child: Column(
        children: [
          CustomHeader(
            showMenuIcon: true,
            onMenuPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          const Expanded(child: HomeViewBody()),
        ],
      ),
    );
  }
}
