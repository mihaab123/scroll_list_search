// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GifModel {
  final String id;
  final String title;
  final String url;

  GifModel(
    this.id,
    this.title,
    this.url,
  );

  GifModel copyWith({
    String? id,
    String? title,
    String? url,
  }) {
    return GifModel(
      id ?? this.id,
      title ?? this.title,
      url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'url': url,
    };
  }

  factory GifModel.fromMap(Map<String, dynamic> map) {
    return GifModel(
      map['id'] as String,
      map['title'] as String,
      map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GifModel.fromJson(String source) =>
      GifModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GifModel(id: $id, title: $title, url: $url)';

  @override
  bool operator ==(covariant GifModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ url.hashCode;
}
