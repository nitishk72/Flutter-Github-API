import 'package:flutter/material.dart';
class User extends StatelessWidget {
  final String text;
  final String image;
  User({this.text,this.image});

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.symmetric(vertical: 5.0,),
          child: new Row(
            children: <Widget>[
              new Container(
                child: new FadeInImage.assetNetwork(
                    placeholder: "https://avatars1.githubusercontent.com/u/424443?s=400&v=4",
                    image: "image",
                    width: 120.0,
                ),
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
