import 'package:flutter/material.dart';
import 'package:flutter_appasd/src/animation/saveImageOnCanvas.dart';
import 'package:flutter_appasd/src/home/UserList.dart';
import 'package:flutter_appasd/src/home/Home.dart';
import 'package:flutter_appasd/src/CollapsingToolbar.dart';
import 'package:flutter_appasd/src/loginWithbloc/Login.dart';
import 'package:flutter_appasd/src/signup/SignupScreen.dart';

class NavDrawer extends StatefulWidget {
  @override  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nav Drawer")),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Pratap Kumar"),
              accountEmail: new Text("kprathap23@gmail.com"),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('images/img_two.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/46.jpg")),
            ),
            new ListTile(
                leading: Icon(Icons.library_music),
                title: new Text("Animation On Canvas"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) {
                        return SaveImg(title: "Animation On Canvas");
                      },
                    ),
                  );
                }),
            new ListTile(
                leading: Icon(Icons.movie),
                title: new Text("Bloc Pattern"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) {
                        return Login(title: "Login using Bloc");
                      },
                    ),
                  );
                }),
            new ListTile(
                leading: Icon(Icons.shopping_cart),
                title: new Text("Collapsing Toolbar"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) {
                        return PestoDemo();
                      },
                    ),
                  );
                }),
            new ListTile(
                leading: Icon(Icons.apps),
                title: new Text("Form Layout"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) {
                        return SignupScreen(title: "SignUp",);
                      },
                    ),
                  );
                }),
            new ListTile(
                leading: Icon(Icons.dashboard),
                title: new Text("Ui Example"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) {
                        return Home();
                      },
                    ),
                  );
                }),
           /* new ListTile(
                leading: Icon(Icons.settings),
                title: new Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new Divider(),
            new ListTile(
                leading: Icon(Icons.info),
                title: new Text("About"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.power_settings_new),
                title: new Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                }),*/
          ],
        ),
      ),
    );
  }



}