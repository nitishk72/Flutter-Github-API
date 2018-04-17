import 'package:flutter/material.dart';
class ShowProfile extends StatelessWidget{
  final String username;
  ShowProfile({this.username});
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Read More",
      home: new Scaffold(
        appBar: AppBar(
          title: new Text("Read More"),
        ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(username),
            new RaisedButton(onPressed: (){Navigator.pop(context);},child: new Text("Back"),),
          ],
        ),
      ),
      ),
    );
  }

}