import 'package:flutter/material.dart';

class TiendasDropDown extends StatefulWidget {
  TiendasDropDown() : super();

  @override
  TiendasDropDownState createState() => TiendasDropDownState();

  static String tienda = '';
}

class Tiendas {
  int id;
  String tienda;

  Tiendas(this.id, this.tienda);
  static List<Tiendas> getTiendas() {
    return <Tiendas>[
      Tiendas(2, 'Mas dulce que la miel'),
      Tiendas(3, 'Doña Pili'),
      Tiendas(4, 'El sason'),
      Tiendas(5, 'La capital'),
      Tiendas(6, 'El guzzi')
    ];
  }
}

class TiendasDropDownState extends State<TiendasDropDown> {
  List<Tiendas> _horarios = Tiendas.getTiendas();
  List<DropdownMenuItem<Tiendas>> _dropdownMenuItems;
  Tiendas _selectedTiendas;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_horarios);
    _selectedTiendas = _dropdownMenuItems[0].value;
    TiendasDropDown.tienda = _selectedTiendas.tienda;
    super.initState();
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
