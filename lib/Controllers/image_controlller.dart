import 'dart:io';
import 'package:get/get.dart';
import 'package:studentapp/Functions/image_picker.dart';

class ImageController extends GetxController {
  var imagepath = Rx<File?>(null);

  void pickImage() async {
    File? pickedImage = await ImagePickerService().pickImageFromGallery();
    if (pickedImage != null) {
      imagepath.value = pickedImage;
    }
  }

  void clearImage() {
    imagepath.value = null;
  }

  void setImage(File image) {
    imagepath.value = image;
  }
}
