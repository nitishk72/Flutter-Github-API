import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ReqRes{

  Future get(String url) async{
    var resBody;
    var res = await http
          .get(url);
    resBody = json.decode(res.body);
    return resBody;
  }

}