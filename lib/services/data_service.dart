import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_code_brothers/data/api_routes.dart';
import 'package:the_code_brothers/models/comments_models.dart';
import 'package:the_code_brothers/models/gallery_models.dart';

class GalleryDataService {
  Future<List<GalleryInfo>> getGallery() async {
    final uri = Uri.https(ApiRoutes.baseUrl, ApiRoutes.photos);
    final response = await http.get(uri);
    List<dynamic> json = jsonDecode(response.body);
    List<GalleryInfo> gallery =
        json.map((galleryJson) => GalleryInfo.fromJson(galleryJson)).toList();
    return gallery;
  }
}

class CommentsDataService {
  Future<List<CommentsInfo>> getComments() async {
    final uri = Uri.https(ApiRoutes.baseUrl, ApiRoutes.comments);
    final response = await http.get(uri);
    List<dynamic> json = jsonDecode(response.body);
    List<CommentsInfo> comments = json
        .map((commentsJson) => CommentsInfo.fromJson(commentsJson))
        .toList();
    return comments;
  }
}
