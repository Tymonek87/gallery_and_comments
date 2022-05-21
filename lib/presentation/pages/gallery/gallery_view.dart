import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_code_brothers/models/gallery_models.dart';
import 'package:the_code_brothers/presentation/pages/gallery/gallery_cubit.dart';
import 'package:the_code_brothers/presentation/pages/widgets/gallery_grid_view.dart';


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
            child: BlocBuilder<GalleryCubit, List<GalleryInfo>>(
              builder: ((context, gallery) {
                if (gallery.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GalleryGridView(gallery);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
