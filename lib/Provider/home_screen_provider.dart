  import 'package:flutter/foundation.dart';
  import 'package:news_app/Api/api.dart';
  import 'package:news_app/Constants/app_Url.dart';
  import 'package:news_app/Models/news_Model.dart';

  class HomeScreenProvider with ChangeNotifier {
    final List<Article> _articleList = [];

    bool _isDataFetched = false;

    List<Article> get articlesList => [..._articleList];

    /// To toggle isFavorite field of an article
    void toggleFavorite(String publishedAt) {
      final articleIndex = _articleList.indexWhere((article) => article.publishedAt == publishedAt);
      if (articleIndex >= 0) {
        _articleList[articleIndex].isFavorite = !_articleList[articleIndex].isFavorite;
        notifyListeners();
      }
    }

    /// To get list of articles whose isFavorite field is true
    List<Article> getFavoriteItems() {
      return _articleList.where((article) => article.isFavorite).toList();
    }

    Future<void> getNewsResponse(context) async {
      if (_isDataFetched) {
        return;
      }

      _articleList.clear();

      // debugPrint("before api is hit");
      var endPoint = "q=${AppUrl.query}&from=${AppUrl.todayDate}&sortBy=${AppUrl.sortBy}&apiKey=${AppUrl.apiKey}";
      final extractedData = await ApiClient().getRequest(endPoint: endPoint.toString());
      if(extractedData["status"] == "ok") {
        debugPrint("Api is hit");
      }
      else {
        debugPrint("Api didnt hit");
      }
      // debugPrint("After api is hit");

      // debugPrint(extractedData.toString());
      // debugPrint(data.toString());

      /// Method 1
      // for (var json in extractedData["articles"]) {
      //   _articleList.add(Article.fromJson(json));
      // }

      /// Method 2
      // Method 2 Explanation 1
      // In this code, you use the map method to iterate over each JSON object in extractedData['articles'].
      // For each JSON object, you create an Article object using the Article.fromJson constructor and add it to the _articleList using the add method.
      // However, the map method returns an Iterable, so you need to convert it to a list using toList() to trigger the iteration and perform the add operation on each item.
      // Please note that using addAll is generally more efficient and recommended when adding multiple items to a list.
      // However, if you prefer to use add specifically, the code provided above achieves the desired result.

      /// Method 2 Explanation 2
      // In the code extractedData['articles'].map((json) => _articleList.add(Article.fromJson(json))).toList();,
      // the map function is used to iterate over each element of the 'articles' list in extractedData.
      // Inside the map function, each JSON object json is converted into an Article object using the fromJson constructor of the Article class.

      /// Method 2 Explanation 3
      // Overall, this code iterates over the JSON objects in the 'articles' list,
      // converts each JSON object into an Article object, adds the Article object to the _articleList,
      // and finally converts the result into a list.

      // Method 2 executable Line
      // extractedData['articles'].map((json) => _articleList.add(Article.fromJson(json))).toList();

      /// Method 3

      // Method 3 Explanation 1
      // 1. `(extractedData['articles'] as List<dynamic>)`: This part retrieves the value associated with the key `'articles'` from the `extractedData` map and casts it to a `List<dynamic>`. Assuming `'articles'` contains a list of JSON objects, this code ensures that the value is treated as a list.
      // 2. `.map((json) => Article.fromJson(json))`: The `map` function is called on the list obtained in the previous step. It applies the provided function `(json) => Article.fromJson(json)` to each element of the list. This function converts each JSON object into an `Article` object using the `fromJson` constructor of the `Article` class.
      // 3. `.toList()`: The `map` function returns an `Iterable<Article>`, but since `_articleList` is a `List<Article>`, we use the `toList()` method to convert the iterable into a list.
      // 4. `_articleList.addAll(...)`: Finally, the `addAll` method is used to add all the `Article` objects from the converted list to the `_articleList`. The `addAll` method appends the elements to the end of the list.
      // So, overall, this code retrieves the JSON array of articles, maps each JSON object to an `Article` object, converts the iterable of `Article` objects to a list, and then adds all the `Article` objects to the `_articleList`.

      // Method 3 Explanation 2
      // (extractedData['articles'] as List<dynamic>): This part casts the value of extractedData['articles'] to a List<dynamic>. It assumes that the value stored in extractedData['articles'] is a list containing dynamic objects.
      // .map((json) => Article.fromJson(json)): This part applies the map function to each element in the list. It takes a function that receives each element json and converts it into an Article object using the fromJson constructor of the Article class. The result is a new iterable that contains the converted Article objects.
      // .toList(): This part converts the resulting iterable from the map function into a list. It collects all the Article objects and returns them as a list.
      // _articleList.addAll(...): Finally, this line adds all the Article objects from the converted list to the _articleList. It appends the Article objects to the end of the list.
      // In summary, this code takes the list of dynamic objects stored in extractedData['articles'], maps each object to an Article object using the fromJson constructor, converts the result into a list, and then adds all the Article objects to the _articleList.

      // Method 3 executable Line
      _articleList.addAll((extractedData['articles'] as List<dynamic>).map((json) => Article.fromJson(json)).toList());

      _isDataFetched = true;
      notifyListeners();
    }

  }