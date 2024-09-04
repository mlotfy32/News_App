class News {
  final String author;
  late final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String name;
  News(
      {required this.author,
      required this.content,
      required this.description,
      required this.publishedAt,
      required this.title,
      required this.url,
      required this.urlToImage,
      required this.name});
  factory News.fromJson(jsonData) {
    return News(
        author: jsonData['author'] == null ? 'notFound' : jsonData['author'],
        content: jsonData['content'],
        description: jsonData['description'] == null ||
                jsonData['description'] == '[Removed]'
            ? 'Not Found'
            : jsonData['description'],
        publishedAt: jsonData['publishedAt'],
        title: jsonData['title'] == null || jsonData['title'] == '[Removed]'
            ? 'Not Found'
            : jsonData['title'],
        url: jsonData['url'],
        urlToImage: jsonData['urlToImage'] == null
            ? 'https://cdn.pixabay.com/photo/2021/01/10/20/03/laptop-5906264_640.png'
            : jsonData['urlToImage'],
        name: jsonData['source']['name'] == null ||
                jsonData['source']['name'] == '[Removed]'
            ? 'Not Found'
            : jsonData['source']['name']);
  }
}
