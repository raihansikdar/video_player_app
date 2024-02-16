import 'dart:convert';
import 'dart:developer';

import 'package:html/parser.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart';
import 'package:video_player_app/src/services/network_response.dart';


class NetworkCaller{
  ///----------------------------------->> get request method <<----------------------------------
  static Future<NetworkResponse> getRequest(String url) async{
    try{
      Response response = await get(Uri.parse(url),headers: {'Content-Type': 'application/json'});

      log("getRequest statusCode ==> ${response.statusCode}");
      //  log("getRequest body ==> ${response.body}");

      if(response.statusCode == 200 ){
        var convertedBody = convertText(response.body);
        log("getRequest statusCode ==> ${convertedBody}");
        return NetworkResponse(isSuccess: true, statusCode: response.statusCode, body: jsonDecode(response.body));
      }else{
        return NetworkResponse(isSuccess: false, statusCode: response.statusCode, body: null);
      }

    }catch(e){
      log(e.toString());
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }
  static convertText(var data) {
    var unescape = HtmlUnescape();
    var document = parse(utf8.decode(data.codeUnits));
    String parsedString = unescape.convert(document.body?.text ?? '');
    return parsedString;
  }

}