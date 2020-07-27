
import 'package:http/http.dart';
import 'dart:convert';

class NetworkHandel {
  final String url;
  NetworkHandel(this.url);

  Future getData() async{
    Response response = await get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print((data));
      return data;
     
    } else {
      print("something wrong happen");
    }

  }

}