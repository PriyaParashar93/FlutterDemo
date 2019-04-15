import 'package:flutter/material.dart';
import 'package:flutter_appasd/src/custom_widgets/CustomDialog.dart';
import 'package:flutter_appasd/src/custom_widgets/CustumContainer.dart';
import 'package:flutter_appasd/src/custom_widgets/loginEditText.dart';
import 'package:flutter_appasd/src/signup/ClickListeners.dart';


class SignupScreen extends StatefulWidget {
  SignupScreen({Key key, this.title}) : super(key: key);
  final String title;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignupScreen> implements ClickListeners {
  List _cities = ["-Select Country-", "India", "China", "Bhutan", "Nepal"];
  TextEditingController _nameController = TextEditingController(),
      _mobileController = TextEditingController(),
      _emailController = TextEditingController(),
      _addressController = TextEditingController();
  var _snackKey = GlobalKey<ScaffoldState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;
  int radioValue = 0;
  bool tNc = false;
  Scaffold _scaffold;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    createScaffold();
    super.initState();
  }

  createScaffold() {
    _scaffold = new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50.0),
                child: new Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
        loginEditText("Name", Icon(Icons.account_circle),
            TextInputType.text, _nameController)
            .build(context),

              new loginEditText("Email", Icon(Icons.email),
                      TextInputType.emailAddress, _emailController)
                  .build(context),
              new loginEditText("Mobile No.", Icon(Icons.phone),
                      TextInputType.number, _mobileController)
                  .build(context),
              new loginEditText("Address", Icon(Icons.add_location),
                      TextInputType.multiline, _addressController)
                  .build(context),
              new CustomContainer(new DropdownButtonHideUnderline(
                  child: new DropdownButton(
                isExpanded: true,
                value: _currentCity,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              ))),
              new Container(
                  margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.blueAccent)),
                  child: new Row(children: <Widget>[
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("Gender "),
                          new Radio<int>(
                            value: 0,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged,
                          ),
                          new Text(
                            'Male',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          new Radio<int>(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged,
                          ),
                          new Text(
                            'Female',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ]),
                  ])).build(context),
              new Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: new Row(
                  children: <Widget>[
                    new Checkbox(value: tNc, onChanged: _value1Changed),
                    new Text("Accept Terms and Condition")
                  ],
                ),
              ),
              new Container(
                margin: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 5.0),
                color: Colors.blue,
                child: new SizedBox(
                  width: double.infinity,
                  child: new RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      colorBrightness: Brightness.light,
                      padding: const EdgeInsets.all(18.0),
                      child: new Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            decorationColor: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => new CustomDialog(
                                        "Welcome ${_nameController.text}",
                                        'We are happy with your SIGUP with ${_emailController.text}',
                                        "Got It",
                                        this)
                                    .build(context))
                          }

//                    onPressed:()=> showPopup(context),
//                    onPressed:()=>StudentRecord("Abc",1,"XYZ"),
                      ),
                ),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold;
  }

  void _value1Changed(bool value) => setState(() => tNc = value);

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(
            city,
            style: TextStyle(background: null),
          )));
    }
    return items;
  }


  @override
  void onClick(BuildContext context) {
    Navigator.of(context).pop();
    final snackBar = SnackBar(
      content: Text(
        'Successfully SignUp :)',
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor: Colors.deepOrange,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}
