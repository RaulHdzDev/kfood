import 'package:flutter/material.dart';

class SearcherFoodPage extends StatefulWidget {
  SearcherFoodPage({Key key}) : super(key: key);

  @override
  _SearcherFoodPageState createState() => _SearcherFoodPageState();
}

class _SearcherFoodPageState extends State<SearcherFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextField(
        autofocus: false,
        cursorColor: Colors.white,
        style: TextStyle(
          fontSize: 22.0,
          fontFamily: 'SFUIDisplay',
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(244, 67, 54, 90.0),
          hintText: 'Tacos, Sopes, Migadas, ...',
          hintStyle: TextStyle(
            color: Colors.white30,
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white70,
          ),
          contentPadding: EdgeInsets.all(20),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(25.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(25.7),
          ),
        ),
      ),
    );
  }
}
