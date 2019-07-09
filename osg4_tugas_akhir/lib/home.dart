import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'list.dart';
import 'model-data.dart';

Future<List<Root>> fetchPosts(http.Client client) async {
  final response =
      await client.get('https://db.ygoprodeck.com/api/v5/cardinfo.php');

  return compute(parsePosts, response.body);
}

List<Root> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Root>((json) => Root.fromJson(json)).toList();
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);
  final HomePageState state = new HomePageState();
  @override
  HomePageState createState() => state;
}

class HomePageState extends State<HomePage> {
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Are you sure you want to exit?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Root>>(
          future: fetchPosts(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? ListViewPosts(roots: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}