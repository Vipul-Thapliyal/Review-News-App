import 'package:flutter/material.dart';
import 'package:news_app/Models/news_Model.dart';
import 'package:news_app/Models/saved_News_Model.dart';

class SavedArticleScreenProvider with ChangeNotifier {
  List<SavedArticles> _savedArticleList = [];

  List<SavedArticles> get savedArticlesList => [..._savedArticleList];

  SavedArticles? savedArticlesVar;

  addData(
    {
      uniqueId,
      author,
      title,
      name,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
      int? index
    }
  ) {

    savedArticlesVar = SavedArticles(
      // source: element["source"],
      uniqueId: uniqueId,
      author: author ?? "",
      title: title ?? "",
      name: name ?? "",
      description: description ?? "",
      url: url ?? "",
      urlToImage: urlToImage ?? "",
      publishedAt: publishedAt ?? "",
      content: content ?? "",
    );
    print("index data type");

    _savedArticleList.add(savedArticlesVar!);
    notifyListeners();
  }


  removeItemById(uniqueId) {
    _savedArticleList.removeWhere((element) => element.uniqueId == uniqueId);
    notifyListeners();
  }
}