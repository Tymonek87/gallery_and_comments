import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_code_brothers/presentation/pages/gallery/cubit/gallery_cubit.dart';
import 'package:the_code_brothers/presentation/pages/widgets/error_view.dart';

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
            child: BlocBuilder<GalleryCubit, GalleryState>(
              builder: ((context, state) {
                if (state is GalleryLoaded) {
                  return GalleryGridView(state.list);
                }
                if (state is GalleryError) {
                  return ErrorView(message: state.error,
                    function: context.read<GalleryCubit>().getGallery,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
