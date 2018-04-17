import 'package:flutter/material.dart';
class Gist extends StatelessWidget{
  String description,created_at;
  Gist({this.description,this.created_at});
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        height: 180.0,
        padding: EdgeInsets.all(15.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(description,style: TextStyle(fontSize: 18.0),),
            new Text("Created : $created_at")
          ],
        ),
      ),
    );
  }

}