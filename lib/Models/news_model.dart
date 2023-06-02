class Articles {
  String? name;
  var author;
  String? title;
  String? description;
  String? url;
  var urlToImage;
  String? publishedAt;
  String? content;
  bool isFavorite;

  Articles(
    {
      required this.name,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
      this.isFavorite = false,
    }
  );
}
