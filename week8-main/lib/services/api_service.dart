import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://dog.ceo/api"; //공통된 부분

  Future<List<dynamic>> multipleRandomImages() async {
    final Uri url =
        Uri.parse("$baseUrl/breeds/image/random/50"); //강아지 random으로 50개 가져올거임

    final response =
        await http.get(url); //JSON으로 쓰여진 코드를 가져오는 package를 씀.(http)

    //await 쓸 때 async같이 써야돼
    print(jsonDecode(response.body));

    try {
      print(jsonDecode(response.body)["message"]);
      return jsonDecode(response.body)["message"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> multipleCorgiImages() async {
    final Uri url = Uri.parse("$baseUrl/breed/corgi/cardigan/images/random/50");

    final response = await http.get(url);

    try {
      print(jsonDecode(response.body)["message"]);
      return jsonDecode(response.body)["message"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> multipleRetrieverImages() async {
    final Uri url =
        Uri.parse("$baseUrl/breed/Golden Retriever/images/random/50");

    final response = await http.get(url);

    try {
      print(jsonDecode(response.body)["message"]);
      return jsonDecode(response.body)["message"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
