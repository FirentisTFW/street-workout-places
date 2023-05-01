import 'package:image_picker/image_picker.dart';

class DeviceImagePickerService {
  Future<List<String>> pickMultipleImages() async {
    final ImagePicker picker = ImagePicker();
    try {
      final List<XFile> images = await picker.pickMultiImage();
      return images.map((image) => image.path).toList();
    } catch (_) {
      return [];
    }
  }
}
