import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/bienvenida/data.dart';
import 'package:kfood_app/presentacion/bienvenida/principalinicio.dart';
import 'package:kfood_app/presentacion/loginPage/loginPage.dart';

/*
void main() {
  runApp(MyApp());
}

*/

class BienvenidaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Saludo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Saludo extends StatefulWidget {
  @override
  _SaludoState createState() => _SaludoState();
}

class _SaludoState extends State<Saludo> {

  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
     margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color.fromRGBO(230, 81, 0, 1) : Color.fromRGBO(230, 81, 0, 1),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color.fromRGBO(230, 81, 0, 1), const Color.fromRGBO(230, 81, 0, 1),])),
      child: Scaffold(
        
        body: Container(
           decoration: BoxDecoration(
                 image: DecorationImage(image: AssetImage('assets/images/imagenP1.png'),
                   fit: BoxFit.fill),
                     gradient: LinearGradient(
                    begin: Alignment.topRight,
                     end: Alignment.bottomLeft,
                    colors: [Colors.white, Colors.white]
                       ),
        ),



          height: MediaQuery.of(context).size.height,
          child: PageView(
            controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
          children: <Widget>[
            SlideTile(
              imagePath: mySLides[0].getImageAssetPath(),
              title: mySLides[0].getTitle(),
              desc: mySLides[0].getDesc(),
            ),
            SlideTile(
              imagePath: mySLides[1].getImageAssetPath(),
              title: mySLides[1].getTitle(),
              desc: mySLides[1].getDesc(),
            ),
            SlideTile(
              imagePath: mySLides[2].getImageAssetPath(),
              title: mySLides[2].getTitle(),
              desc: mySLides[2].getDesc(),
            )
          ],
          ),
        ),



        bottomSheet: slideIndex != 2 ? Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                splashColor: Color.fromRGBO(230, 81, 0, 1),
                child: Text(
                  "Saltar",
                  style: TextStyle(color: Color.fromRGBO(230, 81, 0, 1), fontWeight: FontWeight.w600,fontSize: 15),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    //for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                  ],),
              ),
              FlatButton(
                onPressed: (){
                  print("this is slideIndex: $slideIndex");
                  controller.animateToPage(slideIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.linear);
                },
                splashColor: Color.fromRGBO(230, 81, 0, 1),
                child: Text(
                  "Siguiente",
                  style: TextStyle(color: Color.fromRGBO(230, 81, 0, 1), fontWeight: FontWeight.w600,fontSize: 15),
                ),
              ),
            ],
          ),
        ): InkWell(
          onTap: (){
            Navigator.pushReplacement (
                        context,
                        CupertinoPageRoute(
                         builder: (context)=> HomePage(),
                          )
                      );
           //iniciar
          },
          
          child: Container(
            height: Platform.isIOS ? 70 : 80,
            color: Colors.white,
            alignment: Alignment.center,
            child: Text(
              "Iniciar ahora",
              style: TextStyle(color: Color.fromRGBO(230, 81, 0, 1), fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(title, textAlign: TextAlign.center,style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),),
          SizedBox(
            height: 20,
          ),
          Text(desc, textAlign: TextAlign.center,style: TextStyle(
          fontWeight: FontWeight.w500,
              fontSize: 14))
        ],
      ),
    );
  }
}

