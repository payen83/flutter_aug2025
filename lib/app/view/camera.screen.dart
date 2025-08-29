import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text('Camera'),
      ),
      body: Column(
        children: [
          // Image
          Container(
            margin: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: imageFile != null
            ? Image.file(
              imageFile!,
              fit: BoxFit.cover,
            )
            : Image.asset(
              "assets/images/shapes.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Take Picture'),
                ],
              ),
              onPressed: () async {
                // final ImagePicker picker = ImagePicker();
                // final XFile? camera = await picker.pickImage(source: ImageSource.camera);
                // if (camera != null) {
                //   setState(() {
                //     imageFile = File(camera.path);
                //   });
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}
