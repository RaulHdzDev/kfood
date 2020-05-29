import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/comida/foodPage.dart';
import 'package:kfood_app/presentacion/menuPage/ordersPage/orderPage.dart';
import 'package:kfood_app/presentacion/menuPage/profilePage/profilePage.dart';
import 'package:progress_dialog/progress_dialog.dart';

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
  ProgressDialog pr;
  int pageindex = 0;

  Widget _showPage = new ItemFood();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        pageindex = 0;
        pr.show();
        Future.delayed(Duration(seconds: 2)).then((value) {
          pr.hide();
        });
        return ItemFood();
        break;
      case 1:
        pageindex = 1;
        pr.show();
        Future.delayed(Duration(seconds: 2)).then((value) {
          pr.hide();
        });
        return OrderPage();
        break;
      case 2:
        pageindex = 2;
        pr.show();
        Future.delayed(Duration(seconds: 2)).then((value) {
          pr.hide();
        });
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
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Por favor espere. :D',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Color.fromRGBO(239, 108, 0, 1),),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 13.0, /*fontWeight: FontWeight.w400*/
        ),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 15.0));
    return new Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          key: _bottomNavigationKey,
          currentIndex: pageindex,
          unselectedItemColor: Colors.black38,
          selectedItemColor: Color.fromRGBO(239, 108, 0, 1),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood),
                title: new Text(
                  "Menú",
                  style: TextStyle(color: Colors.black38),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                title: new Text(
                  "Tu Orden",
                  style: TextStyle(color: Colors.black38),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: new Text(
                  "Perfil",
                  style: TextStyle(color: Colors.black38),
                )),
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
