import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/menuPage/ordersPage/orderPage.dart';
import 'package:kfood_app/presentacion/menuPage/profilePage/profilePage.dart';

import 'foodPage/comida/foodPage.dart';

class HomeShop extends StatefulWidget {
  const HomeShop({Key key}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}


class _BottomNavBarState extends State<HomeShop> {
  int pageindex = 1;

  Widget _showPage = new ItemFood();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return ItemFood();
        break;
      case 1:
        return OrderPage();
        break;
      case 2:
        return ProfilePage();
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text("No page Found"),
          ),
        );
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: FancyBottomNavigation(
          barBackgroundColor: Colors.white70,
          activeIconColor: Colors.white,
          inactiveIconColor: Color.fromRGBO(248, 64, 0, 1),
          circleColor:  Color.fromRGBO(248, 64, 0, 1),
          tabs: [
            TabData(iconData: Icons.fastfood, title: "Menu"),
            TabData(iconData: Icons.shopping_cart, title: "Orden"),
            TabData(iconData: Icons.person, title: "Perfil")
          ],
          onTabChangedListener: (position) {
            setState(() {
              _showPage = _pageChooser(position);
            });
          },
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: _showPage,
          ),
        ));
  }
  
}
