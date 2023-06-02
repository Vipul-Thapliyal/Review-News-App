import 'package:flutter/foundation.dart';
import 'package:news_app/Api/api.dart';
import 'package:news_app/Constants/app_Url.dart';
import 'package:news_app/Models/news_Model.dart';

class HomeScreenProvider with ChangeNotifier {

  final List<Articles> _articleList = [];

  bool _isDataFetched = false;

  List<Articles> get articlesList => [..._articleList];

  /// To toggle isFavorite field of an article
  void toggleFavorite(String publishedAt) {
    final articleIndex = _articleList.indexWhere((article) => article.publishedAt == publishedAt);
    if (articleIndex >= 0) {
      _articleList[articleIndex].isFavorite = !_articleList[articleIndex].isFavorite;
      notifyListeners();
    }
  }

  /// To get list of articles whose isFavorite field is true
  List<Articles> getFavoriteItems() {
    return _articleList.where((article) => article.isFavorite).toList();
  }

  Future<void> getNewsResponse(context) async {
    if (_isDataFetched) {
      return;
    }

    _articleList.clear();

    if(kDebugMode) {
      // print("today data inside getNewsResponse");
      // print(AppUrl.todayDate);
    }

    var endPoint = "q=${AppUrl.query}&from=${AppUrl.todayDate}&sortBy=${AppUrl.sortBy}&apiKey=${AppUrl.apiKey}";
    final extractedData = await ApiClient().getRequest(endPoint: endPoint.toString());

    for (var element in extractedData["articles"] as List<dynamic>) {
      _articleList.add(
        Articles(
          name: element["source"]["name"] ?? "",
          author: element["author"] ?? "",
          title: element["title"] ?? "",
          description: element["description"] ?? "",
          url: element["url"] ?? "",
          urlToImage: element["urlToImage"] ?? "",
          publishedAt: element["publishedAt"] ?? "",
          content: element["content"] ?? "",
          isFavorite: false,
        ),
      );
    }

    _isDataFetched = true;
    notifyListeners();
  }

}