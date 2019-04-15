import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_appasd/src/utils/BlockingClass.dart';
import 'package:rxdart/rxdart.dart';

class ValidationBloc implements BlocBase {

  StreamController<String> _emailController = BehaviorSubject<String>();
  Stream<String> get outCounter => _emailController.stream;

StreamController<String> _passController =  BehaviorSubject<String>();
  Stream<String> get passStream => _passController.stream;

  StreamController<bool> _btnController = BehaviorSubject<bool>();
  Stream<bool> get btnStream => _btnController.stream;

  String _email,_password;



  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.close();
    _passController.close();
  }

  void emailValidation(email)
  {
    this._email=email;
    if (email.contains('@')) {
      _emailController.sink.add(email);
    } else {
      _emailController.sink.addError('Enter a valid email');
    }
    isValid();

  }


  void passValidation(passowrd)
  {
    this._password=passowrd;
    if (passowrd.toString().length>5) {
      _passController.sink.add(passowrd);
    } else {
      _passController.sink.addError('Password must be 6 digits');
    }
    isValid();
  }


  void isValid()
  {bool flag = false;
    if (_email.contains("@") && _password.length > 5)
      flag = true;

   _btnController.sink.add(flag);
  }



  submit() {
    final validEmail = outCounter.toString();
    final validPassword = passStream.toString();
    print('Email is $validEmail, and password is $validPassword');
  }
}