import 'package:flutter/material.dart';
class Starred extends StatelessWidget{
  String name,description,language;
  final int stargazers_count,forks_count;

  Starred(this.name, this.stargazers_count, this.forks_count,this.language){
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.symmetric(vertical: 5.0,),
          child: new Row(
            children: <Widget>[
              new Container(
                child: new CircleAvatar(child: new Text(name[0].toUpperCase(),style: TextStyle(fontSize: 42.0),)),
                width: 80.0,
                height: 80.0,margin: EdgeInsets.only(right: 10.0),
              ),
              new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(name,style: TextStyle(fontSize: 20.0),maxLines: 12,),
                    new Container(
                      margin: EdgeInsets.only(top: 8.0,bottom: 4.0),
                      child: new Text("Language : $language"),
                    ),
                    new Row(
                      children: <Widget>[
                        new Text("Star : $stargazers_count",textAlign: TextAlign.left,),
                        new Text("Fork : $forks_count",textAlign: TextAlign.right,),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}