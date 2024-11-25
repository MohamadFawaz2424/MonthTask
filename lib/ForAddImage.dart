import 'dart:typed_data';
import 'package:ex_month/main.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:image_picker/image_picker.dart';

class ForImage extends StatefulWidget {
  const ForImage({super.key});

  @override
  State<ForImage> createState() => _ForImageState();
}

class _ForImageState extends State<ForImage> {
  Uint8List? _imageData;

  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final imageBytes = await image.readAsBytes();
      setState(() {
        _imageData = imageBytes;

        const materialBanner = MaterialBanner(
          elevation: 0,
          backgroundColor: Colors.transparent,
          forceActionsBelow: true,
          content: AwesomeSnackbarContent(
            title: 'Add Successful',
            message: 'Congratulations, you have added a photo via filters!!!',
            contentType: ContentType.success,
            inMaterialBanner: true,
          ),
          actions: [SizedBox.shrink()],
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentMaterialBanner()
          ..showMaterialBanner(materialBanner);
      });
    } else {
      setState(() {
        const materialBanner2 = MaterialBanner(
          elevation: 0,
          backgroundColor: Colors.transparent,
          forceActionsBelow: true,
          content: AwesomeSnackbarContent(
            title: 'Error ',
            message: 'You Did Not Add Any Image!!!',
            contentType: ContentType.failure,
            inMaterialBanner: true,
          ),
          actions: [SizedBox.shrink()],
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentMaterialBanner()
          ..showMaterialBanner(materialBanner2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Monthly Task')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Image page ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Main page '),
              onTap: () {
                ScaffoldMessenger.of(context)..hideCurrentMaterialBanner();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SizedBox(
          height: sizeScreen.height,
          width: sizeScreen.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: _imageData == null
                    ? Text('Choose a Photo From Your Gallery')
                    : Image.memory(_imageData!),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Add Photo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
