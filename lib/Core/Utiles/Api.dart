import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/Features/Home/Data/Model.dart';
import 'package:translator/translator.dart';

class AppServices {
  Dio _dio = Dio();
  //
  String _baseUrl = 'https://newsapi.org/v2/everything?q=';
  String _apiKey = '24ffc5e7b19d441aa6d0c6bb5d15877a';
  Future<List<News>> getNews(String q, String year, String m) async {
    String newM = m.length == 1 ? '0$m' : m;
    var D =
        DateTime.now().day != '1' ? DateTime.now().day - 1 : DateTime.now().day;

    String a = '$q world&from=$year-$newM-2&sortBy=publishedAt&apiKey=';
    List<News> newsList = [];
    var response = await _dio.get('$_baseUrl$a$_apiKey');
    var data = response.data;
    for (int i = 0; i < data['articles'].length; i++) {
      newsList.add(News.fromJson(data['articles'][i]));
    }
    return newsList;
  }
}
