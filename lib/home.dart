import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_trimmer/video_trimmer.dart';

import 'trimmer_view.dart';

class HomePage extends StatelessWidget {
  final Trimmer _trimmer = Trimmer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Trimmer"),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("LOAD VIDEO"),
            onPressed: () async {
              PickedFile result =
                  await ImagePicker().getVideo(source: ImageSource.gallery);
              
              //FilePickerResult result = await FilePicker.platform.pickFiles(
              //  type: FileType.video,
              //  allowCompression: false,
              //);
              if (result != null) {
                File file = File(result.path);
                await _trimmer.loadVideo(videoFile: file);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TrimmerView(_trimmer);
                  }),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
