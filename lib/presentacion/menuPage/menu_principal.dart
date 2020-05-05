import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/comida/foodPage.dart';
import 'package:kfood_app/presentacion/menuPage/ordersPage/orderPage.dart';
import 'package:kfood_app/presentacion/menuPage/profilePage/profilePage.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: KfoodNavigationBar(),
      body: Container(
        child: Center(
          child: Text("Inicio Page"),
        ),
      ),
    );
  }
}


class KfoodNavigationBar extends StatefulWidget {
  KfoodNavigationBar({Key key}) : super(key: key);

  @override
  _KfoodNavigationBarState createState() => _KfoodNavigationBarState();
}

class _KfoodNavigationBarState extends State<KfoodNavigationBar> {

  int pageindex = 0;

  Widget _showPage = new ItemFood();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
      pageindex=0;
        return ItemFood();
        break;
      case 1:
      pageindex=1;
        return OrderPage();
        break;
      case 2:
      pageindex=2;
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
    return new Scaffold(
       bottomNavigationBar: BottomNavigationBar(
         key: _bottomNavigationKey,
          currentIndex: pageindex,
          unselectedItemColor: Colors.black38,
          selectedItemColor: Color.fromARGB(255, 177, 145, 1),
         items: 
         [
           BottomNavigationBarItem(
             icon: Icon(Icons.fastfood),
             title: new Text("Menú", style: TextStyle(
               color: Colors.black38
             ),)
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.shopping_cart, ),
             title: new Text("Tu Orden", style: TextStyle(
               color: Colors.black38
             ),)
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.person),
             title: new Text("Perfil", style: TextStyle(
               color: Colors.black38
             ),)
           ),
         ],
       onTap: (int tappindex) {
            setState(() {
              _showPage = _pageChooser(tappindex);
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