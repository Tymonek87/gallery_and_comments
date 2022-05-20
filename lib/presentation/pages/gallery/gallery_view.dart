import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:the_code_brothers/data/api_routes.dart';
import 'package:the_code_brothers/models/gallery_models.dart';
import 'package:the_code_brothers/presentation/pages/widgets/gallery_grid_view.dart';

Future<List<GalleryInfo>> downloadJSON() async {
  final uri = Uri.https(ApiRoutes.baseUrl, ApiRoutes.photos);

  final response = await get(uri);

  if (response.statusCode == 200) {
    List gallery = json.decode(response.body);
    return gallery.map((gallery) => GalleryInfo.fromJson(gallery)).toList();
  } else {
    throw Exception('We were not able to successfully download the json data.');
  }
}

class GalleryView extends StatelessWidget {
  final String title;
  const GalleryView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
          ),
          body: Center(
            child: FutureBuilder<List<GalleryInfo>>(
              future: downloadJSON(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<GalleryInfo>? gallery = snapshot.data;
                  return GalleryGridView(gallery!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
