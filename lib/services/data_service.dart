import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:the_code_brothers/data/api_routes.dart';

import 'package:the_code_brothers/models/comments_models.dart';
import 'package:the_code_brothers/models/gallery_models.dart';

class GalleryDataService {
  Future<List<GalleryInfo>> getGallery() async {
    var responseJson;
    try {
      final uri = Uri.https(ApiRoutes.baseUrl, ApiRoutes.photos);
      final response = await http.get(uri).timeout(const Duration(seconds: 20));
      responseJson = _returnResponse(response);
      List<dynamic> json = jsonDecode(response.body);
      List<GalleryInfo> gallery = json
          .map((galleryJson) =>
              GalleryInfo.fromJson((galleryJson) as Map<String, dynamic>))
          .toList();
      return gallery;
    } on SocketException {
      rethrow;
    }
  }
}

class CommentsDataService {
  Future<List<CommentsInfo>> getComments() async {
    var responseJson;
    try {
      final uri = Uri.https(ApiRoutes.baseUrl, ApiRoutes.comments);
      final response = await http.get(uri).timeout(const Duration(seconds: 20));
      responseJson = _returnResponse(response);
      List<dynamic> json = jsonDecode(response.body);
      List<CommentsInfo> comments = json
          .map((commentsJson) => CommentsInfo.fromJson(commentsJson))
          .toList();
      return comments;
    } on SocketException {
      rethrow;
    }
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
  }
}
