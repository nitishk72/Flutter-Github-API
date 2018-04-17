import 'package:flutter/material.dart';
class Gist extends StatelessWidget{
  String description,created_at;
  Gist({this.description,this.created_at});
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        child: new Column(
          children: <Widget>[
            new Text(description),
            new Text("Created : $created_at")
          ],
        ),
      ),
    );
  }

}