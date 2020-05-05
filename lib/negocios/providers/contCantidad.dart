

import 'package:flutter/cupertino.dart';

class ContCantidad with ChangeNotifier{
  
  int _cont = 1;

  get cont {
    return _cont;
  }

  set cont(int cont){
    if(cont > 0 && cont <= 10){
      this._cont = cont;
      notifyListeners();
    }
    
    
  }

  reiniciarCont(){
    _cont = 1;
    //notifyListeners();
  }

}