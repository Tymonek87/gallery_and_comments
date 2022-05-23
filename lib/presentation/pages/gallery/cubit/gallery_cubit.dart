import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_code_brothers/models/gallery_models.dart';
import 'package:the_code_brothers/services/data_service.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  final _dataService = GalleryDataService();
  GalleryCubit() : super(GalleryLoading());

  void getGallery() async {
    try {
      emit(GalleryLoading());
      List<GalleryInfo> list = await _dataService.getGallery();
      emit(GalleryLoaded(list: list));
    } on SocketException {
      emit(GalleryError(error: "Internet connection error"));
    } catch (ex) {
      emit(GalleryError(error: "Something went wrong"));
    }
  }
}
