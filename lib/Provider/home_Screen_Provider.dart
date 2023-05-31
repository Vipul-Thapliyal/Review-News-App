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


  Future<void> getNewsResponse(context) async {
    _articleList.clear();

    final queryParameters = {
      "param1" : "q=tesla",
      "param2" : "from=2023-04-30",
      "param3" : "sortBy=publishedAt",
      "param4" : "apiKey=407b60d366ba45eca22378ceab32488a",
    };

    var endpoint = queryParameters["param1"]! +"&" + queryParameters["param2"]! + "&"  + queryParameters["param3"]! + "&" + queryParameters["param4"]!;

    final extractedData = await Api().get(endPoint: endpoint.toString());

    final tempList = extractedData["articles"] as List<dynamic>;
    _articleList = addListItem(tempList);
  }

}