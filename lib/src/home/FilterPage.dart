import 'package:flutter/material.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart';
import 'package:flutter_appasd/src/home/UserList.dart';

class FilterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FilterPageState();
  }
}

class FilterPageState extends State<FilterPage> {

  List<SectionTextModel> sectionTexts = [];

  @override
  void initState() {
    super.initState();

    for(int i=65;i<=90;i++)
      {
        sectionTexts.add(
            SectionTextModel(
              text: String.fromCharCode(i),
              position: i-64,
              progressColor: Colors.white70,
            ));
      }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 55.0, left: 15.0),
          margin: EdgeInsets.only(left: 15.0, top: 25.0),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Filters",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 6.0),
                child: Text(
                  "Website",
                  style: TextStyle(color: Colors.white70, fontSize: 16.0),
                ),
              ),
              Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Chip(
                    backgroundColor: Colors.white70,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900,
                    ),
                    label: new Text('.org'),
                  ),
                  Chip(
                    backgroundColor: Colors.white70,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900,
                    ),
                    label: new Text('.net'),
                  ),
                  Chip(
                    backgroundColor: Colors.white70,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900,
                    ),
                    label: new Text('.info'),
                  ),
                  Chip(
                    backgroundColor: Colors.white70,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900,
                    ),
                    label: new Text('.biz'),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Text(
                  "Username starts with",
                  style: TextStyle(color: Colors.white70, fontSize: 16.0),
                ),
              ),
              Container(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0, right: 15.0),
                  child: SeekBar(
                      isCanTouch: true,
                      indicatorRadius: 0.0,
                      progresseight: 5.0,
                      progressColor: Colors.white,
                      value: 10,
                      hideBubble: false,
                      alwaysShowBubble: true,
                      bubbleRadius: 10,
                      bubbleColor: Colors.blue.shade900,
                      bubbleTextColor: Colors.white,
                      bubbleTextSize: 10,
                      bubbleMargin: 4,
                      sectionTexts: sectionTexts,
                      min: 0,
                      max: 26,
                      sectionCount: 26,
                      sectionRadius: 0,
                      sectionTextMarginTop: 5,
                      sectionDecimal: 0,
                      sectionTextColor: Colors.black,
                      sectionSelectTextColor: Colors.white,
                      sectionTextSize: 14,
                      showSectionText: true,
                      afterDragShowSectionText: true,
                      bubbleInCenter: true),
                ),
              ),
              
              InkWell(
onTap: () {
Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => UserList()));
//  Navigator.pop(context);
},


                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      height: 50.0,
                      width: 100.0,
                      margin: EdgeInsets.only(top: 30.0),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30.0)),
                        color: Colors.lime,
                      ),
                      child: Center(
                        child: Image.asset(
                          "images/right_arrow.png",
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),

        InkWell(
          onTap:()
          {
            Navigator.pop(context);
          },
          child: Container(
            height: 65,
            width: 35.0,
            margin: EdgeInsets.only(left: 25.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.orangeAccent),
            child: Center(
              child: Image.asset(
                "images/down_arrow.png",
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

}
