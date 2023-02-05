import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salaa_app/constant.dart';
import 'package:salaa_app/view/screens/azkarScreen.dart';
import 'package:salaa_app/view/screens/homeScreen.dart';

import 'sabahScreen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selected = 0;
  List Screens = [
    HomeScreen(),
    AzkarScreen(),
    SabahScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_selected],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/homegray.svg"),
              activeIcon: SvgPicture.asset("assets/icons/homegreen.svg"),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/bookgray.svg"),
              label: '',
              activeIcon: SvgPicture.asset("assets/icons/bookgreen.svg")),
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset("assets/icons/sebhagray.svg"),
              activeIcon: SvgPicture.asset("assets/icons/sebhagreen.svg")),
        ],
        backgroundColor: white,
        onTap: (index) {
          setState(() {
            _selected = index;
          });
        },
        currentIndex: _selected,
        iconSize: 20,
        elevation: 1,
      ),
    );
  }
}
