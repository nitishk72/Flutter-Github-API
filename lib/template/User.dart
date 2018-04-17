import 'package:flutter/material.dart';
class User extends StatelessWidget {
  final String text;
  final String image;
  User({this.text,this.image});

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
          height: 150.0,
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.symmetric(vertical: 5.0,),
          child: new Row(
            children: <Widget>[
              new Container(
                child: new Image.network(image,width: 120.0,),
                margin: EdgeInsets.only(right: 10.0),
              ),
              new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(text,style: TextStyle(fontSize: 22.0),),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
