import 'package:dinkid_mobile/View/Pages/budget_page.dart';
import 'package:dinkid_mobile/View/Pages/create_budge_page.dart';
import 'package:dinkid_mobile/View/Pages/daily_page.dart';
import 'package:dinkid_mobile/View/Pages/profile_page.dart';
import 'package:dinkid_mobile/View/Pages/stats_page.dart';
import 'package:dinkid_mobile/Theme/colors.dart';
import 'package:dinkid_mobile/View/Pages/lancamento.dart';
import 'package:dinkid_mobile/View/Pages/Usuario/Config/CategoriasView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  List<Widget> pages = [
    DailyPage(),
    BudgetPage(),
    CategoriasView(),
    Lancamento(),
  ];

  void initializeStuff() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {});
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: getFooter(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            selectedTab(3);
          },
          child: Icon(
            Icons.attach_money,
            size: 25,
          ),
          backgroundColor: primary,
          //params
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.md_wallet,
      Ionicons.md_list,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.end,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
