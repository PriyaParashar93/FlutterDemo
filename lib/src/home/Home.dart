import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_appasd/src/home/FilterPage.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomepageState();
  }
}

class HomepageState extends State<Home> with SingleTickerProviderStateMixin {
  double scalVal=0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController bottomSheetController;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
  key: scaffoldKey,
  body: NestedScrollView(
  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
  return <Widget>[_myAppBar()];
  },
  body: Stack(
  children: <Widget>[
  Container(
  height: MediaQuery.of(context).size.height,
  decoration: BoxDecoration(
  gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.1, 0.0, 0.0, 0.0],
  colors: [
  // Colors are easy thanks to Flutter's Colors class.
  Colors.blueAccent[200],
  Colors.white,
  Colors.white,
  Colors.white,
  ],
  ),
  ),
  child: new ListView.builder(
  itemCount: 60,
  itemBuilder: (BuildContext context, int index) {
  return listItem(index);
  },
  ),
  ),
  Positioned(
  bottom: 0.0,
  child: Container(
  height: 100.0,
  width: MediaQuery.of(context).size.width,
  decoration: BoxDecoration(
  gradient: LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  stops: [0.5, 0.7, 0.9, 1.0, 1.3
  ],
  colors: [
  Colors.white,
  Colors.white70,
  Colors.white30,
  Colors.white10,
  Colors.transparent,
  ])),
  child: InkWell(
  onTap:()
  {
  _fabClicked(context);
  },
  child: Center(
  child:Container(
  height: 70,
  width: 70,
  margin: EdgeInsets.only(bottom: 15.0),
  decoration: BoxDecoration(
  color: Colors.blueAccent,
  borderRadius: BorderRadius.circular(20.0)),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
  Image.asset(
  "images/filter.png",
  height: 16.0,
  width: 16.0,
  color: Colors.white,
  ),
  Padding(
  padding: const EdgeInsets.only(top: 8.0),
  child: Text(
  "Filter",
  style: TextStyle(
  color: Colors.white, fontSize: 14.0),
  ),
  )
  ],
  ),
  ),
  ),
  )),
  ),
//            FilterPage(),
  ],
  ),
  ),
  );
}

  _myAppBar() {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 3,
      pinned: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications_none,
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Colors.blueAccent,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TyperAnimatedTextKit(
                      text: ["London"],
                      textStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.white30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      "Birmingham",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                left: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "26 February",
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Average Distance",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.white70),
                        ),
                        Text(
                          " 2h 24m",
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(int index) {
    return Container(
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: getColor(index),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(22.0, 20.0, 0.0, 0.0),
        height: 150,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: index % 2 == 0 ? Colors.white : Colors.black12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.adjust,
                            color: Colors.blueAccent,
                            size: 14.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text("11:00",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12.0,
                                )),
                          ),
                          Text(
                            "Hammersmith",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.adjust,
                            color: Colors.black26,
                            size: 14.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text("11:00",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12.0,
                                )),
                          ),
                          Text(
                            "Cathedral square",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    "19",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ),
            Divider(
              height: 3.0,
              color: Colors.black26,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      "images/messenger.png",
                      color: Colors.black26,
                      height: 30.0,
                      width: 30.0,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset(
                        "images/messenger.png",
                        color: Colors.black26,
                        height: 30.0,
                        width: 30.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Gobriel,",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 13.0),
                            ),
                            Text(
                              " 39 y/o",
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 12.0),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "48 - ",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 13.0),
                            ),
                            Text(
                              "8 rating",
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        width: 35.0,
                        height: 35.0,
                        margin: EdgeInsets.fromLTRB(10.0, 10, 20, 10),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://i.imgur.com/BoN9kdC.png"))))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Color getColor(int selector) {
    if (selector == 0)
      return Colors.transparent;
    else if (selector % 2 == 0) {
      return Colors.black12;
    } else {
      return Colors.white;
    }
  }

 void _fabClicked( conext) {


    showModalBottomSheet(context: conext, builder: (BuildContext)
    {
      return FilterPage();
    });



  }
  
}
