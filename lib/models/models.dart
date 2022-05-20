class GalleryInfo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  GalleryInfo({required this.albumId,required this.id,required this.title,required this.url,required this.thumbnailUrl});

  factory GalleryInfo.fromJson(Map<String, dynamic> json) {
    final albumId = json['albumId'];
    final id = json['id'];
    final title = json['title'];
    final url = json['url'];
    final thumbnailUrl = json['thumbnailUrl'];

  return GalleryInfo(albumId: albumId, id: id, title: title, url: url, thumbnailUrl: thumbnailUrl);
  }
}

class CommentsInfo {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  CommentsInfo({required this.postId, required this.id, required this.name, required this.email, required this.body});

  factory CommentsInfo.fromJson(Map<String, dynamic> json) {
    final postId = json['postId'];
    final id = json['id'];
    final name = json['name'];
    final email = json['email'];
    final body = json['body'];

    return CommentsInfo(postId: postId, id: id, name: name, email: email, body: body);
  }
}

