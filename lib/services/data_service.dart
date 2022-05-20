import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:the_code_brothers/models/models.dart';

class GalleryDataService {
  Future<GalleryInfo> getGallery() async {
    

    final uri = Uri.https(
      'jsonplaceholder.typicode.com','/photos');

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return GalleryInfo.fromJson(json);
  }
}

class CommentsDataService {
  Future<GalleryInfo> getGallery() async {
    

    final uri = Uri.https(
      'jsonplaceholder.typicode.com','/comments');

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return GalleryInfo.fromJson(json);
  }
}