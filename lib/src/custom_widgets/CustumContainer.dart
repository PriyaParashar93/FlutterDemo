import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
   Widget widgets;


   CustomContainer( this.widgets);

  @override
  Widget build (BuildContext context){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 0.0),

      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.blueAccent)
      ),
      child: widgets,
    );
  }
}