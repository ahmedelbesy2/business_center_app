import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

enum PickType { camera, gallery }

class ImageHelper {


  final ImagePicker imagePicker = ImagePicker();
  final ImageCropper imageCropper = ImageCropper();

  static ImageHelper? _instance;

  ImageHelper._internal() {
    _instance = this;
  }

  static ImageHelper get i {
    return _instance ?? ImageHelper._internal();
  }

  Future<File?> pickImage({double? maxHeight = 1024, double? maxWidth, int? imageQuality, required PickType type}) async {
    File? image;
    try {
      final pickedFile = await imagePicker.pickImage(
        source: type == PickType.gallery ? ImageSource.gallery : ImageSource.camera,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        imageQuality: imageQuality,
      );
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    } catch (e) {
      return null;
    }
    return await cropImage(image: image);
  }

  Future<List<File>> pickMultiImage({
    double? maxHeight,
    double? maxWidth,
  }) async {
    List<File> images = [];

    try {
      final pickedFile = await imagePicker.pickMultiImage(
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      );
      for (var img in pickedFile) {
        images.add(File(img.path));
      }
    } catch (e) {
      return images;
    }
    return images;
  }

  Future<File?> cropImage({
    required File? image,
    bool isAvatar = false,
  }) async {
    if (image != null) {
      final img = await imageCropper.cropImage(
        sourcePath: image.path,
        cropStyle: isAvatar ? CropStyle.circle : CropStyle.rectangle,
        // aspectRatioPresets: aspRat,
      );
      image = File(img!.path);
    }
    return image;
  }
}
