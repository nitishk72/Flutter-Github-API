import 'package:flutter/material.dart';
class Starred extends StatelessWidget{
  String name,description,language;
  final int stargazers_count,forks_count;
  Starred(this.name, this.description, this.stargazers_count, this.forks_count,
      this.language){
    if(this.description == null){
      this.description = "No Description";
    }
    if(this.language == null){
      this.language == "No Language";
    }
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
                child: new CircleAvatar(child: new Text(name[0].toUpperCase()),),
                margin: EdgeInsets.only(right: 10.0),
              ),
              new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(name,style: TextStyle(fontSize: 20.0),maxLines: 12,),
                    new Text("Language : $language"),
//                    new Text(description,maxLines: 12,),
                    new Text("Star : $stargazers_count"),
                    new Text("Fork : $forks_count"),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}