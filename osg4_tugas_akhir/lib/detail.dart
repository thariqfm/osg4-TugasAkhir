import 'package:flutter/material.dart';
import 'model-data.dart';

class Detail extends StatefulWidget {
  final Root roots;

  Detail({Key key, @required this.roots}) : super(key: key);

  final DetailState state = new DetailState();

  @override
  DetailState createState() => state;
}

class DetailState extends State<Detail> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _scaffoldKey
        .currentState
        .showSnackBar(SnackBar(content: Text('Detail'))));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: new Container(
        // color: Color(0XFFF0F4F5),
        color: Colors.white,
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new Container(
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Stack(
                        children: <Widget>[
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            height: 350,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3d3d3d),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.4),
                                    BlendMode.dstATop),
                                image: NetworkImage(
                                    widget.roots.cardImages[0].imgUrl),
                              ),
                            ),
                          ),
                          new Container(
                            margin: const EdgeInsets.only(top: 40.0),
                            width: MediaQuery.of(context).size.width,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Container(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: new GestureDetector(
                                    child: new Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      onBack();
                                    },
                                  ),
                                ),
                                new Container(
                                  child: new Text(
                                    widget.roots.data_name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20.0),
                                  ),
                                ),
                                new Container(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  // child: new Icon(
                                  //   Icons.share,
                                  //   color: Colors.white,
                                  // ),
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: new EdgeInsets.only(top: 280.0),
                            child: new Container(
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(12.0),
                                      topRight: const Radius.circular(12.0))),
                              padding: new EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 20.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  new Container(
                                    margin: new EdgeInsets.only(
                                        top: 10.0,
                                        left: 15.0,
                                        bottom: 10.0,
                                        right: 15.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Container(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: new Icon(
                                            Icons.find_in_page,
                                            color: Colors.black,
                                          ),
                                        ),
                                        new Text(
                                          widget.roots.cardSets[0].setDataRarity,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                              fontFamily: 'Quicksand-Light',
                                              color: Colors.black),
                                        ),
                                        new Container(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, right: 10.0),
                                          child: new Icon(
                                            Icons.monetization_on,
                                            color: Colors.black,
                                          ),
                                        ),
                                        new Text(
                                          widget.roots.cardPrices.cardmarketPrice,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                              fontFamily: 'Quicksand-Light',
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Container(
                                    margin: new EdgeInsets.only(
                                        top: 16.0,
                                        left: 16.0,
                                        bottom: 16.0,
                                        right: 16.0),
                                    child: new Text(
                                      widget.roots.data_desc,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'Quicksand-Medium',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onBack() {
    Navigator.pop(context);
  }
}
