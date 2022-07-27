import 'dart:convert';

import 'package:http/http.dart';
import 'package:untitled/model/article.dart';

class ApiService{
  final endpoint ="https://newsapi.org/v2/everything?q=tesla&from=2022-06-27&sortBy=publishedAt&apiKey=6786d3f0a6a34878b9efe21151ccbc92";

  Future<List<Article>>getArticle() async{
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      Map<String, dynamic> json=jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    }
    else{
      throw('Data has error');
    }
  }
}
