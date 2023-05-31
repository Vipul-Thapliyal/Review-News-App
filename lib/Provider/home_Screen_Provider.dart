import 'package:flutter/material.dart';
import 'package:news_app/Api/api.dart';
import 'package:news_app/Models/news_Model.dart';

class HomeScreenProvider with ChangeNotifier {

  List<Articles> _articleList = [];
  List<Articles> get articlesList => [..._articleList];


  addListItem(List<dynamic> tempList) {
    final List<Articles> loadedServices = [];

    for (var element in tempList) {
      loadedServices.add(
        Articles(
          uniqueId: DateTime.now().microsecondsSinceEpoch,
          name: element["source"]["name"] ?? "",
          author: element["author"] ?? "",
          title: element["title"] ?? "",
          description: element["description"] ?? "",
          url: element["url"] ?? "",
          urlToImage: element["urlToImage"] ?? "",
          publishedAt: element["publishedAt"] ?? "",
          content: element["content"] ?? "",
        ),
      );
    }
    return loadedServices;
  }


  Future<void> getNewsRespone(context) async {
    _articleList.clear();

    var link = "https://newsapi.org/v2/everything?q=tesla&from=2023-04- 30&sortBy=publishedAt&apiKey=c1435bbe401f4b638ab25d623f2e64fa";

    final extractedData = await Api().get(endPoint: link.toString());

    final tempList = extractedData["articles"] as List<dynamic>;
    _articleList = addListItem(tempList);
  }

}