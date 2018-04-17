import 'package:flutter/material.dart';
import 'package:github_api/template/Starred.dart';
import 'package:github_api/template/gists.dart';
import 'package:github_api/template/repo.dart';
import 'package:github_api/template/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ShowProfile extends StatefulWidget{
  final String username,user;
  ShowProfile({this.username,this.user});
  @override
  State<StatefulWidget> createState() {
    return new ProfileState(username:username,user:user);
  }
}
class ProfileState extends State<ShowProfile>{
  bool repo_loading = true,gist_loading = true,star_loading = true,followers_loading = true,following_loading = true;
  bool repo_data = false,gist_data = false,star_data = false,followers_data = false,following_data = false;

  String username,user;
  ProfileState({this.username,this.user}){
    this.username = username;
  }
  String base_url = "https://api.github.com/users/";
  String getURL(){
    return base_url+user+"/";
  }
  var ResBody;
  List<Repo> _repo = [];
  List<Gist> _gist = [];
  List<Starred> _starred =[];
  List<User> _followers =[];
  List<User> _following =[];
  getRepo() async{
    var res = await http.get(getURL()+"repos", headers: {"Accept": "application/json"});
    ResBody = json.decode(res.body);
    setState(() {
      for(var data in ResBody){
        _repo.add(
            new Repo(
                data['name'],
                data['description'],
                data['stargazers_count'],
                data['forks_count'],
                data['language']
            ));
        repo_data = true;
      }
    });
    repo_loading = false;
  }
  getGist() async{
    var res = await http.get(getURL()+"gists", headers: {"Accept": "application/json"});
    ResBody = json.decode(res.body);
    setState(() {
      for(var data in ResBody){
        _gist.add(
            new Gist(
                description : data['files'].keys.first,
                created_at : data['created_at']
            ));
        gist_data = true;
      }

      gist_loading = false;
    });
  }
  getStarred() async{
    var res = await http.get(getURL()+"starred", headers: {"Accept": "application/json"});
    ResBody = json.decode(res.body);
    setState(() {
      for(var data in ResBody){
        _starred.add(
            new Starred(
                data['name'],
                data['stargazers_count'],
                data['forks_count'],
                data['language']
            ));
        star_data = true;
      }

      star_loading = false;
    });
  }
  getFollowers() async{
    var res = await http.get(getURL()+"followers", headers: {"Accept": "application/json"});
    ResBody = json.decode(res.body);
    setState(() {
      for(var data in ResBody){
        _followers.add(
            new User(
              text: data['login'],
              image: data['avatar_url'],
            ));
        followers_data =  true;
      }
      followers_loading = false;
    });
  }
  getFollowing() async{
    var res = await http.get(getURL()+"following", headers: {"Accept": "application/json"});
    ResBody = json.decode(res.body);
    setState(() {
      for(var data in ResBody){
        _following.add(
            new User(
              text: data['login'],
              image: data['avatar_url'],
            ));

        following_data = true;
      }
    });
    following_loading = false;
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Profile",
      home: new DefaultTabController(
        length: 6,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(username),
            bottom: new TabBar(
              isScrollable: true,
              tabs: [
                new Tab(child: new Text("Overview")),
                new Tab(child: new Text("Repository")),
                new Tab(child: new Text("Gists")),
                new Tab(child: new Text("Starred")),
                new Tab(child: new Text("Follower")),
                new Tab(child: new Text("Following")),
              ],
            )
          ),
          body: new TabBarView(
            children: [
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.code,size: 100.0,),
                    new Text("Overview",style: Theme.of(context).textTheme.display2),
                  ],
                )
              ),
              new Container(
                child: _Repo_data()
              ),
              new Container(
                  child: _Gist_data()
              ),
              new Container(
                  child: _Starred_data()
              ),
              new Container(
                  child: _Followers_data()
              ),
              new Container(
                  child: _Following_data()
              ),
            ],
          ),
        ),
      ),
    );

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRepo();
    getGist();
    getStarred();
    getStarred();
    getFollowers();
    getFollowing();
  }
  Widget _Repo_data() {
    if(repo_loading){
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else{
      return new Column(
        children: <Widget>[
          new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                itemBuilder: (_, int index) => _repo[index],
                itemCount: _repo.length,
              )
          )
        ],
      );
    }
  }
  Widget _Gist_data() {
    if(gist_loading){
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else{
      return new Column(
        children: <Widget>[
          new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                itemBuilder: (_, int index) => _gist[index],
                itemCount: _gist.length,
              )
          )
        ],
      );
    }
  }
  Widget _Starred_data() {
    if(star_loading){
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else{
      return new Column(
        children: <Widget>[
          new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                itemBuilder: (_, int index) => _starred[index],
                itemCount: _starred.length,
              )
          )
        ],
      );
    }
  }

  Widget _Following_data() {
    if(following_loading){
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else if(!following_data){
      return new Center(
        child:new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("$user has no Followers",style: Theme.of(context).textTheme.display1)
            ]
        ),
      );
    }else{
      return new Column(
        children: <Widget>[
          new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                itemBuilder: (_, int index) => _following[index],
                itemCount: _following.length,
              )
          )
        ],
      );
    }
  }

  Widget _Followers_data() {
    if(followers_loading){
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else if(!followers_data){
      return new Center(
        child:new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("$user is not following to anyone",style: Theme.of(context).textTheme.display1)
          ]
        ),
      );
    }else{
      return new Column(
        children: <Widget>[
          new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                itemBuilder: (_, int index) => _followers[index],
                itemCount: _followers.length,
              )
          )
        ],
      );
    }
  }
}