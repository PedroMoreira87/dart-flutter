import 'package:bloc/bloc.dart';


class ImageSelectCubit extends Cubit<ImageSelectState> {
  ImageSelectCubit() :super(ImageSelectState(null));

  void imageSelected(String imageUrl) {
    emit(ImageSelectState(imageUrl));
  }
}

class ImageSelectState {
  String? imageUrl;

  ImageSelectState(this.imageUrl);
}