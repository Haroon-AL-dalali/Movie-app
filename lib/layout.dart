import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movieapp/home_screen.dart';
import 'package:movieapp/top.dart';
import 'package:movieapp/trending.dart';
import 'package:movieapp/upcoming.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}
  int _selectedIndex = 0;
  List<Widget>screens= const[
    HomeScreen(),
    TrendingScreen(),
    TopScreen(),
    UpcomingScreen()
  ];

class _LayoutState extends State<Layout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
             bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
              
                GButton(
                  icon: Icons.flash_on,
                  text: 'Ternding',
                ),
                GButton(
                  icon: Icons.arrow_circle_up,
                  text: 'Top',
                ),
                 GButton(
                  icon: Icons.fiber_new_sharp,
                  text: 'UpComing',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });})
    )
    )
    )
    );
  }
}