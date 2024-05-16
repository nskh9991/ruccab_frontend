import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_ruccab/main.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({Key? key}) : super(key: key);

  @override
  _LicenseScreenState createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  File? _imageFile;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _expirationController = TextEditingController();
  final TextEditingController _vehicleClassController = TextEditingController();

  Future<void> _captureImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadLicense() async {
    if (_imageFile == null) {
      print('No image selected.');
      return;
    }
    var x = await httpRequest.addlisense(_dateController.text,
        _expirationController.text, _vehicleClassController.text, _imageFile);

    print(x);
    if (x[0] == true) {
      Navigator.pop(context);
    }

    // final url = Uri.parse('YOUR_BACKEND_URL/licenses');
    // final request = http.MultipartRequest('POST', url)
    //   ..fields['dateCreated'] = _dateController.text
    //   ..fields['expirationDate'] = _expirationController.text
    //   ..fields['vehicleClass'] = _vehicleClassController.text
    //   ..files.add(await http.MultipartFile.fromPath('image', _imageFile.path));

    // try {
    //   final response = await http.Response.fromStream(await request.send());
    //   if (response.statusCode == 200) {
    //     print('License information added successfully.');
    //   } else {
    //     print('Failed to add license information: ${response.body}');
    //   }
    // } catch (e) {
    //   print('Failed to add license information: $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('License Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Date Created'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _expirationController,
                decoration: const InputDecoration(labelText: 'Expiration Date'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _vehicleClassController,
                decoration: const InputDecoration(labelText: 'Vehicle Class'),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _captureImage,
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                    const Size(300, 50),
                  )),
                  child: const Text('Take Picture'),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: _uploadLicense,
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                    const Size(300, 50),
                  )),
                  child: const Text('Upload License'),
                ),
              ),
              if (_imageFile != null) ...[
                const SizedBox(height: 20),
                Image.file(_imageFile!),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _expirationController.dispose();
    _vehicleClassController.dispose();
    super.dispose();
  }
}
