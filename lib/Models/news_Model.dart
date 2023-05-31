class Articles {
  var uniqueId;
  Source? source;
  String? name;
  var author;
  String? title;
  String? description;
  String? url;
  var urlToImage;
  String? publishedAt;
  String? content;

  Articles(
    {
      // required this.source,
      required this.uniqueId,
      required this.name,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
    }
  );
}

class Source {
  String? id;
  String? name;

  Source(
    {
      required this.id,
      required this.name,
    }
  );
}