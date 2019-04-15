import 'package:flutter/material.dart';

class loginEditText extends StatelessWidget {
  final TextInputType inputType;
  final Icon  icon;
  final String hintTxt;
  ValueChanged<String> eingegebenerWert;
  TextEditingController editingController;

  loginEditText( this.hintTxt, this.icon,this.inputType,this.editingController);

  @override
  Widget build (BuildContext context){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
      child: new TextField(
        keyboardType:inputType,
        controller:editingController ,
        decoration: new InputDecoration(
            hintText: hintTxt,
            contentPadding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 4.0),
            border: OutlineInputBorder(),
            prefixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 0),
              child:  icon, // myIcon is a 48px-wide widget.
            )

        ),
      ),
    );
  }
}