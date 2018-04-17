import 'package:flutter/material.dart';
import 'package:github_api/ShowProfile.dart';
class ProfileCard extends StatelessWidget {
  ProfileCard({this.user,this.text,this.image ,this.public_repos,this.following,this.followers,this.animationController});

  final String text;
  final String user;
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
          curve: Curves.linear,
        ),
        axisAlignment: 0.0,
        child: new Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: new RaisedButton(
              color: Colors.white,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new ShowProfile(username:this.text,user:this.user)));
              },
              child: new Container(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                margin: const EdgeInsets.only(right: 5.0),
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
                              new Text('Following : $following')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),
        )
    );
  }
}
