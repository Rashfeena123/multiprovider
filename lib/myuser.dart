import 'package:flutter/material.dart';

class MyUser extends ChangeNotifier{
  bool isSignedIn =false;


  changeStatus(){
    isSignedIn=!isSignedIn;
    notifyListeners();

  }
}