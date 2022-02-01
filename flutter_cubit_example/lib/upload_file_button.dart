import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:typed_data';
import 'dart:io';

import 'package:flutter_cubit_example/image_select_bloc.dart';

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

      /* upload to storage */
      await FirebaseStorage.instance
          .ref('uploads/$fileName')
          .putData(fileBytes!);
      String imageUrl = await FirebaseStorage.instance
          .ref('uploads/$fileName').getDownloadURL();

      final imageSelectCubit = BlocProvider.of<ImageSelectCubit>(context);
      imageSelectCubit.imageSelected(imageUrl);
      return imageUrl;
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
