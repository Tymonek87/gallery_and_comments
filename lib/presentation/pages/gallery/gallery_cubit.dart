import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_code_brothers/models/gallery_models.dart';
import 'package:the_code_brothers/services/data_service.dart';


class GalleryCubit extends Cubit<List<GalleryInfo>> {
  final _dataService = GalleryDataService();

  GalleryCubit() : super([]);

  void getGallery() async => emit(await _dataService.getGallery());
}