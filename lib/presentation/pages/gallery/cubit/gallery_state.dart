part of 'gallery_cubit.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object> get props => [];
}

class GalleryLoading extends GalleryState {}

class GalleryLoaded extends GalleryState {
  GalleryLoaded({required this.list});
  List<GalleryInfo> list;
}

class GalleryError extends GalleryState {
  GalleryError({required this.error});
  String error;
}
