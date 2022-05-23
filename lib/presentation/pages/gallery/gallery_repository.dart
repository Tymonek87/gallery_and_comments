
import 'package:the_code_brothers/models/gallery_models.dart';
import 'package:the_code_brothers/services/data_service.dart';

class GalleryRepository {


  GalleryDataService helper = GalleryDataService();

  Future <List<GalleryInfo>> fetchGalleryList() async {
    List<GalleryInfo> response = await helper.getGallery();
    return response;
  }
}