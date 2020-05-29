import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kfood_app/negocios/getCafeterias.dart';
import 'package:kfood_app/negocios/providers/cafeterias.dart';

class TiendasDropDown extends StatefulWidget {
  TiendasDropDown() : super();

  @override
  TiendasDropDownState createState() => TiendasDropDownState();

  static String tienda = '';
  static String id = '';
}


class TiendasDropDownState extends State<TiendasDropDown> {
  
  obtenerCafeterias() async{
    Cafeterias cafeterias = Provider.of<Cafeterias>(context);
    await getTiendasList(cafeterias.datosCafeterias).then((lista){
      setState(() {
        _horarios = lista;
        _dropdownMenuItems = buildDropdownMenuItems(_horarios);
        _selectedTiendas = _dropdownMenuItems[0].value;
      });
      Cafeterias cafeterias = Provider.of<Cafeterias>(context);
      cafeterias.cafeterias = _selectedTiendas.id;
      TiendasDropDown.tienda = lista.first.tienda;
    });
  }

  void obtener(){
    obtenerCafeterias();
  }

  List<Tiendas> _horarios = Tiendas.getTiendas();
  List<DropdownMenuItem<Tiendas>> _dropdownMenuItems;
  Tiendas _selectedTiendas;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_horarios);
    super.initState();
    Timer(new Duration(milliseconds: 1), obtener);
  }

  List<DropdownMenuItem<Tiendas>> buildDropdownMenuItems(List tiendasKfood) {
    List<DropdownMenuItem<Tiendas>> items = List();
    for (Tiendas tiend in tiendasKfood) {
      items.add(
        DropdownMenuItem(
          value: tiend,
          child: Text(tiend.tienda, style: TextStyle(color: Colors.black),),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Tiendas selectedTienda) {
    setState(() {
      _selectedTiendas = selectedTienda;
    });
    TiendasDropDown.tienda = _selectedTiendas.tienda;
    TiendasDropDown.id = _selectedTiendas.id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton(
            value: _selectedTiendas,
            items: _dropdownMenuItems,
            onChanged: onChangeDropdownItem,
          ),
        ],
      ),
    );
  }
}
