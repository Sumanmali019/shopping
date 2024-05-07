import 'package:flutter/material.dart';
import 'package:shopping/constant/globle_variable.dart';
import 'package:shopping/screens/home/screen/home_screen.dart';

import '../../screens/account/screen/account_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeNmae = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottombarwith = 42;
  double bottombarborderwith = 5;
  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart is Working '),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //Home
          BottomNavigationBarItem(
            icon: Container(
              width: bottombarwith,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottombarborderwith,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),

          //Account
          BottomNavigationBarItem(
            icon: Container(
              width: bottombarwith,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottombarborderwith,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),
          //Card
          BottomNavigationBarItem(
            icon: Container(
              width: bottombarwith,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottombarborderwith,
                  ),
                ),
              ),
              child: const Badge(
                  // textColor: Colors.white,
                  label: Text('2'),
                  child: Icon(Icons.shopping_cart_outlined)),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
