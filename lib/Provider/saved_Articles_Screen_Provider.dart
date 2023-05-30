import 'package:flutter/material.dart';
import 'package:news_app/Models/news_Model.dart';
import 'package:news_app/Models/saved_News_Model.dart';

class SavedArticleScreenProvider with ChangeNotifier {
  List<SavedArticles> _savedArticleList = [];

  List<SavedArticles> get savedArticlesList => [..._savedArticleList];

  SavedArticles? savedArticlesVar;

  addData(
    {
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
      author: author,
      title: title,
      name: name,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
    print("index data type");
    // print(index.runtimeType);
    // print(index.toString());
    _savedArticleList.add(savedArticlesVar!);
    // _savedArticleList.insert(index!, savedArticlesVar!);
    notifyListeners();
  }

  removeData(int index, String content) {
    print("removed item at index" + "$index");
    // _savedArticleList.removeAt(index);
    // _savedArticleList.removeWhere((element) => element.content.toString() == "${content.toString()}");
  }

  // addListItem(Articles element) {
  //   _savedArticleList.clear();
  //     // print("element in home_screen");
  //     // print(element.toString());
  //     _savedArticleList.add(
  //       SavedArticles(
  //         // source: element["source"],
  //         author: element.author,
  //         title: element.title,
  //         name: element.name,
  //         description: element.description,
  //         url: element.url,
  //         urlToImage: element.urlToImage,
  //         publishedAt: element.publishedAt,
  //         content: element.content,
  //       )
  //     );
  //   notifyListeners();
  // }
}