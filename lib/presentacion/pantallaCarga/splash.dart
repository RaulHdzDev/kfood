import 'package:kfood_app/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container( 
	        child: Column(
	          children: <Widget>[
	            Container(
	              child: Stack(
	                children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height,
                      decoration: new BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(222, 57, 0, 1),
                            Color.fromRGBO(255, 123, 54, 1),
                            ],
                          )
                      ),
                    ),

                  Positioned(
                    width: 130,
                    bottom: 300,
                    left: 130,
                    top: 300,
	                    child: FadeAnimation(.1, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/logoSplash.png'),                     
	                        )
	                      ),         
	                    )
                      ),
	                  ),

                  Positioned(
                    width: 130,
                    bottom: 300,
                    left: 130,
                    top: 470,
	                    child: FadeAnimation(1.5, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/nombreSplash.png'),                     
	                        )
	                      ),         
	                    )
                      ),
	                  ),
	                ],
	              ),
	            ),
	          ],
	        ),
	      ),
      )
    );
  }
}