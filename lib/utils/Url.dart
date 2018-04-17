class Url{
  final String end_point = "https://api.github.com/users/";
  final String username;
  Url({this.username});

  String getURL(){
    return end_point+username;
  }
  String getGistURL(){
    return getURL()+"/gists";
  }
  String getStarredURL(){
    return getURL()+"/starred";
  }
  String getFollowers(){
    return getURL()+"/Follwers";
  }
  String getFollowingURL(){
    return getURL()+"/Following";
  }
}