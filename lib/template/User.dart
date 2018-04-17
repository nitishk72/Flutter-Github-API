import 'package:flutter/material.dart';
import 'package:github_api/ShowProfile.dart';
class User extends StatelessWidget {
  final String text;
  final String image;
  User({this.text,this.image});

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new RaisedButton(
          color: Colors.white,
          onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new ShowProfile(username:"Github API",user:this.text)));
          },
          child: new Container(
              height: 80.0,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              margin: EdgeInsets.symmetric(vertical: 5.0,),
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: new Image.network(image,height: 60.0,width: 60.0,),
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
      )
    );
  }
}
