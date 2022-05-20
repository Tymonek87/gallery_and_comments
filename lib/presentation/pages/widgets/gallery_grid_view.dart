import 'package:flutter/material.dart';
import 'package:the_code_brothers/models/gallery_models.dart';
import 'package:the_code_brothers/presentation/pages/gallery/detali_screen_view.dart';
import 'package:the_code_brothers/presentation/pages/styles/dimens.dart';
 

class GalleryGridView extends StatelessWidget {
  final List<GalleryInfo> gallery;

  const GalleryGridView(this.gallery, {Key? key}) : super(key: key);

  Widget build(context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 5 / 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 4),
      itemCount: gallery.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(gallery[currentIndex], context);
      },
    );
  }

  Widget createViewItem(GalleryInfo gallery, BuildContext context) {
    return ListTile(
        title: Card(
          elevation: 5.0,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimens.m)),
            padding: const EdgeInsets.all(Dimens.s),
            margin: const EdgeInsets.all(Dimens.xs),
            child: Image.network(gallery.thumbnailUrl),
          ),
        ),
        onTap: () {
          var route = MaterialPageRoute(
            builder: (BuildContext context) => DetailScreen(value: gallery),
          );

          Navigator.of(context).push(route);
        });
  }
}