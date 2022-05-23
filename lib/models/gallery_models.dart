class GalleryInfo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  GalleryInfo(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory GalleryInfo.fromJson(Map<String, dynamic> json) {
    final albumId = json['albumId'];
    final id = json['id'];
    final title = json['title'];
    final url = json['url'];
    final thumbnailUrl = json['thumbnailUrl'];

    return GalleryInfo(
        albumId: albumId,
        id: id,
        title: title,
        url: url,
        thumbnailUrl: thumbnailUrl);
  }
}
