import 'package:flutter/material.dart';

import 'package:technical_squid_app/features/home/presentation/views/widgets/custom_drawer.dart';

class DashboardMobileLayout extends StatefulWidget {
  const DashboardMobileLayout({super.key, required this.child});
  final Widget child;

  @override
  State<DashboardMobileLayout> createState() => _DashboardMobileLayoutState();
}

class _DashboardMobileLayoutState extends State<DashboardMobileLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: Column(children: [Expanded(child: widget.child)]),
    );
  }
}
