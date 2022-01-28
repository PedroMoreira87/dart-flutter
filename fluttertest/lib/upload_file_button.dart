import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'dart:typed_data';
import 'dart:io';

class UploadFileButton extends StatelessWidget {
  final Function(String?) callback;

  UploadFileButton(this.callback);

  /* Choose file to upload, returns file if one is selected or null otherwise */
  Future<String?> imagePicker(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    Uint8List? fileBytes;
    String? fileName;

    if (result != null) { // if a file was selected
      if (Theme.of(context).platform == TargetPlatform.android || Theme.of(context).platform == TargetPlatform.iOS) { // mobile
        File file = File(result.files.single.path!); // get chosen file
        fileBytes = await file.readAsBytes(); // convert file to byte array
        fileName = result.files.first.name;
      } else {
        fileBytes = result.files.first.bytes;
        fileName = result.files.first.name;
      }

      final metadata = SettableMetadata(
          customMetadata: {"origin": "[\"*\"]","responseHeader": "[\"Content-Type\"]","method": "[\"GET\", \"HEAD\"]","maxAgeSeconds": "3600"});
      /* upload to storage */
      await FirebaseStorage.instance
          .ref('uploads/$fileName')
          .putData(fileBytes!, metadata);
      return FirebaseStorage.instance
          .ref('uploads/$fileName').getDownloadURL();
    } else {
      return null;
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onAccept: (value) {
        print(value);
      },
      builder: (context, List<dynamic> accepted, List<dynamic> rejected) => IconButton(
          onPressed: () {
            imagePicker(context).then((value){
              callback(value);
            });
          },
          icon: const Icon(
            Icons.add,
          )),
    );
  }
}
