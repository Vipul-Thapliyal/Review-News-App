
class SavedArticles {
  SavedSource? source;
  var author;
  String? name;
  String? title;
  String? description;
  String? url;
  var urlToImage;
  String? publishedAt;
  String? content;
  int? index;

  SavedArticles(
      {
        // required this.source,
        required this.author,
        required this.title,
        required this.name,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
      }
      );
}

class SavedSource {
  String? id;
  String? name;

  SavedSource(
      {
        required this.id,
        required this.name,
      }
      );
}