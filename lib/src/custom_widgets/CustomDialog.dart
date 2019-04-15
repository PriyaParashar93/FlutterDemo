import 'package:flutter/material.dart';
import 'package:flutter_appasd/src/signup/ClickListeners.dart';


class CustomDialog extends StatelessWidget {
  String title,content,btnTxt;
  ClickListeners _clickListeners;


  CustomDialog(this.title,this.content,this.btnTxt,this._clickListeners);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 300,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(15.0),
              child: Text(title, style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(content,textAlign: TextAlign.center,),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            FlatButton(
                color: Colors.blue,
                onPressed: (){
                  _clickListeners.onClick(context);
                },
                child: Text(btnTxt, style: TextStyle(color: Colors.white, fontSize: 18.0),)


            )


          ],
        ),

      ),
    );

  }

}