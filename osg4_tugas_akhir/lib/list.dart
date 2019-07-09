import 'package:osg4_tugas_akhir/detail.dart';
import 'package:flutter/material.dart';
import 'model-data.dart';

class ListViewPosts extends StatelessWidget {
  final List<Root> roots;
  final List<CardImages> cardImages;

  ListViewPosts({Key key, this.roots, this.cardImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: roots.length,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[
              new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        '${roots[position].cardImages[0].imgUrlSmall}'),
                  ),
                  title: new Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      '${roots[position].data_name}',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ),
                  subtitle: new Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text('${roots[position].data_desc.substring(0, 50)}...',
                    style: TextStyle(
                      color: Colors.black),
                      ),
                  ),
                  // trailing: new Icon(Icons.keyboard_arrow_right),
                  trailing: new IconTheme(
                    data: new IconThemeData(color: Colors.black),
                    child: new Icon(Icons.pageview),
                    ),
                  onTap: () => onTapItem(context, roots[position]),
                  selected: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void onTapItem(BuildContext context, Root post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detail(
              roots: post,
            ),
      ),
    );
  }
}
