class NewsArticle {
  NewsArticle(
      {required this.title,
      required this.description,
      required this.author,
      required this.content,
      required this.publishedAt,
      required this.urlToImage,
      required this.articleUrl});

  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;
  final String articleUrl;
}
