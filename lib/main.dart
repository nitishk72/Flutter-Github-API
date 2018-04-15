import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() {
  runApp(new Github());
}


class Github extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Github API",
      home: new GithubAPI(),
    );
  }
}

class ProfileCard extends StatelessWidget {
  ProfileCard({this.text,this.image ,this.public_repos,this.following,this.followers,this.animationController});

  final String text;
  final String image;
  final int public_repos;
  final int followers;
  final int following;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut,
        ),
        axisAlignment: 0.0,
        child: new Card(
          child: new Container(
            margin: const EdgeInsets.all(15.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(right:16.0),
                  child: new Image.network(image,width: 100.0,height: 100.0,),
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                          text,
                          style: Theme.of(context).textTheme.title
                      ),
                      new Padding(padding: EdgeInsets.only(bottom: 30.0)),
                      new Text('Public Repo : $public_repos'),
                      new Padding(padding: EdgeInsets.only(bottom: 6.0)),
                      new Row(
                        children: <Widget>[
                          new Text('Followers : $followers'),
                          new Padding(padding: EdgeInsets.only(right: 15.0)),
                          new Text('Following : $following'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),  
          )
        )
    );
  }
}

class GithubAPI extends StatefulWidget {
  @override
  State createState() => new GithubAPIState();
}

class GithubAPIState extends State<GithubAPI> with TickerProviderStateMixin {
  final List<ProfileCard> _card = <ProfileCard>[];
  final TextEditingController _textController = new TextEditingController();
  var resBody;
  Future _getUser(String text) async{
    _textController.clear();
    String url = "https://api.github.com/users/";
      print(url);
      var res = await http
          .get(Uri.encodeFull(url+text), headers: {"Accept": "application/json"});
      setState(() {
        resBody = json.decode(res.body);
      });
      print(res);
      if(resBody['avatar_url'] !=  null) {
        ProfileCard card = new ProfileCard(
          text: resBody['name'],
          image: resBody['avatar_url'],
          public_repos: resBody['public_repos'],
          following: resBody['following'],
          followers:resBody['followers'],
          animationController: new AnimationController(
            duration: new Duration(milliseconds: 700),
            vsync: this,
          ),
        );
        setState(() {
          _card.insert(0, card);
        });
        card.animationController.forward();
      }
    }

  void dispose() {
    for (ProfileCard message in _card)
      message.animationController.dispose();
    super.dispose();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _getUser,
                decoration:
                new InputDecoration.collapsed(hintText: "Enter Github Username"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                  icon: new Icon(Icons.search),
                  onPressed: () => _getUser(_textController.text)
                  )
              ),
          ]),
      )
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Github API"),
          elevation: 4.0
      ),
      body: new Container(
          child: new Column(
              children: <Widget>[
                new Divider(height: 1.0),
                new Container(
                  decoration: new BoxDecoration(
                      color: Theme.of(context).cardColor),
                  child: _buildTextComposer(),
                ),
                new Flexible(
                    child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      itemBuilder: (_, int index) => _card[index],
                      itemCount: _card.length,
                    )
                ),
              ]
          ),
      )
    );
  }
}