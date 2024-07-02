import 'package:rss_hub/models/author.dart';

class Post {
  final String id;
  final String url;
  final String title;
  final String contentHtml;
  final DateTime datePublished;
  final List<Author> authors;

  Post({
    required this.id,
    required this.url,
    required this.title,
    required this.contentHtml,
    required this.datePublished,
    required this.authors,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      url: json['url'],
      title: json['title'],
      contentHtml: json['content_html'],
      datePublished: DateTime.parse(json['date_published']),
      authors: (json['authors'] as List<dynamic>)
          .map((author) => Author.fromJson(author))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'title': title,
      'content_html': contentHtml,
      'date_published': datePublished.toIso8601String(),
      'authors': authors.map((author) => author.toJson()).toList(),
    };
  }
}
