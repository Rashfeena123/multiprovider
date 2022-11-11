 import 'package:flutter/material.dart';
class MyCart extends ChangeNotifier{
  List  cartList=[];


  addToCart(int index){
    cartList.add(index);
    notifyListeners();
  }

  removeAtLastFromCart(){
    cartList.removeLast();
    notifyListeners();
  }


}