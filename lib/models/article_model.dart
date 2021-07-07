class Article {
  late String title;
  //late String author;
  late String description;
  late String urlToImage;
  late DateTime publishedAt;
  late String content;
  late String articleUrl;
  Article(String title, String description, String urlToImage,
      DateTime publishedAt, String content, String articleUrl) {
    this.title = title;
    // this.author = author;
    this.description = description;
    this.urlToImage = urlToImage;
    this.publishedAt = publishedAt;
    this.content = content;
    this.articleUrl = articleUrl;
  }
}
