import 'package:flutter/material.dart';

import 'package:technical_squid_app/features/home/presentation/views/widgets/custom_drawer.dart';

class DashboardTabletLayout extends StatefulWidget {
  const DashboardTabletLayout({super.key, required this.child});
  final Widget child;

  @override
  State<DashboardTabletLayout> createState() => _DashboardTabletLayoutState();
}

class _DashboardTabletLayoutState extends State<DashboardTabletLayout> {
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
