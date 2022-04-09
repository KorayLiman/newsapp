import 'dart:convert';
import 'package:http/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/article_model.dart';

class ArticleApi {
  static const String _Url =
      "https://newsapi.org/v2/top-headlines?country=tr&apiKey=cfed0c2516fc4740bc8e4a20945135ae";
  static const String _HUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&category=health&apiKey=cfed0c2516fc4740bc8e4a20945135ae";
  static const String _SUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&category=sports&apiKey=cfed0c2516fc4740bc8e4a20945135ae";

  static Future<List<ArticleModel>> GetArticleData() async {
    List<ArticleModel> _List = [];
    var result = await get(Uri.parse(_Url));
    var ArticleList = jsonDecode(result.body)["articles"];
    if (ArticleList is List) {
      _List = ArticleList.map((e) => ArticleModel.fromJson(e)).toList();
    }
    debugPrint(_List.length.toString());

    return _List;
  }

  static Future<List<ArticleModel>> GetHealthArticleData() async {
    List<ArticleModel> _List = [];
    var result = await get(Uri.parse(_HUrl));
    var ArticleList = jsonDecode(result.body)["articles"];
    if (ArticleList is List) {
      _List = ArticleList.map((e) => ArticleModel.fromJson(e)).toList();
    }
    debugPrint(_List.length.toString());

    return _List;
  }

  static Future<List<ArticleModel>> GetSportsArticleData() async {
    List<ArticleModel> _List = [];
    var result = await get(Uri.parse(_SUrl));
    var ArticleList = jsonDecode(result.body)["articles"];
    if (ArticleList is List) {
      _List = ArticleList.map((e) => ArticleModel.fromJson(e)).toList();
    }
    debugPrint(_List.length.toString());

    return _List;
  }
}
