import 'package:flutter/material.dart';

import 'package:poke_app/ui/HomePage/mobileAndTable/mobile_tablet_view.dart';
import 'package:poke_app/ui/Responsive/ResponsiveApp.dart';

import 'package:poke_app/ui/Shared/SideBar/drawer_sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.widget) : super();
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: MobileTabletView(widget),
        tablet: MobileTabletView(widget),
        desktop: Container(
            child: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 2 : 2,
              child: SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 10 : 8,
              child: Container(color: Colors.white, child: widget),
            ),
          ],
        )),
      ),
    );
  }
}
