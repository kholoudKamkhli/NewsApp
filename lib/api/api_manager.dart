import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/SourcesResponse.dart';

import '../news/NewsResponse.dart';
class ApiManager{
  static const String baseUrl = "newsapi.org";
  static const String apiKey = '6a41762a0a394adbb40feead9c17d45c';
  static Future<SourcesResponse>getSources(String category)async{
    var url = Uri.https(baseUrl,"/v2/top-headlines/sources",{
    'apiKey': apiKey,
    'category':category
    });
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return SourcesResponse.fromJson(json);
    //https://newsapi.org/v2/top-headlines/sources?apiKey=6a41762a0a394adbb40feead9c17d45c&category=sports

  }
  //https://newsapi.org/v2/everything?sources=bbc-sport&apiKey=6a41762a0a394adbb40feead9c17d45c
  static Future<NewsResponse>getNews(String sourceID)async{
    var url = Uri.https(baseUrl,"/v2/everything",{
      'apiKey': apiKey,
      'sources':sourceID,
    });
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return NewsResponse.fromJson(json);
  }
}
