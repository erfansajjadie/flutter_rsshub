import 'package:rss_hub/models/post.dart';

class Channel {
  final String version;
  final String title;
  final String homePageUrl;
  final String description;
  final String icon;
  final String language;
  final List<Post> items;

  Channel({
    required this.version,
    required this.title,
    required this.homePageUrl,
    required this.description,
    required this.icon,
    required this.language,
    required this.items,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      version: json['version'],
      title: json['title'],
      homePageUrl: json['home_page_url'],
      description: json['description'],
      icon: json['icon'],
      language: json['language'],
      items: (json['items'] as List<dynamic>)
          .map((item) => Post.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'title': title,
      'home_page_url': homePageUrl,
      'description': description,
      'icon': icon,
      'language': language,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}