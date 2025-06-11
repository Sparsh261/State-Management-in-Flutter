// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

List<Post> postListFromJson(String str) {
  final jsonData = json.decode(str) as List;
  return jsonData.map((item) => Post.fromJson(item)).toList();
}

class Post {
    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    Post({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}


