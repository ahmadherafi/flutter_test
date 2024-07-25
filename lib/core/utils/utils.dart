import 'dart:io';

import 'package:file_picker/file_picker.dart';

class Utils {
  static Future<File> pickImage() async {
    File file = File('');
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
    }
    return file;
  }
}