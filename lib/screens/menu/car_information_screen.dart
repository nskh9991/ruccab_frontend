import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CarInformationScreen extends StatefulWidget {
  const CarInformationScreen({Key? key}) : super(key: key);

  @override
  State<CarInformationScreen> createState() => _CarInformationScreenState();
}

class _CarInformationScreenState extends State<CarInformationScreen> {
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _plateNumberController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _licenseNumberController =
      TextEditingController();
  final TextEditingController _expirationDateController =
      TextEditingController();
  final TextEditingController _vehicleClassController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isEditable = true;

  String url = "null";

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  Future<void> loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _colorController.text = prefs.getString('carColor') ?? '';
      _plateNumberController.text = prefs.getString('carPlateNumber') ?? '';
      _capacityController.text = prefs.getString('carCapacity') ?? '';
      _modelController.text = prefs.getString('carModel') ?? '';
      _licenseNumberController.text = prefs.getString('licenseNumber') ?? '';
      _expirationDateController.text =
          prefs.getString('licenseExpirationDate') ?? '';
      _vehicleClassController.text =
          prefs.getString('vehicleClass') ?? ''; // Load vehicle class
    });
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('carColor', _colorController.text);
    prefs.setString('carPlateNumber', _plateNumberController.text);
    prefs.setString('carCapacity', _capacityController.text);
    prefs.setString('carModel', _modelController.text);
    prefs.setString('licenseNumber', _licenseNumberController.text);
    prefs.setString('licenseExpirationDate', _expirationDateController.text);
    prefs.setString(
        'vehicleClass', _vehicleClassController.text); // Save vehicle class
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
        enabled: _isEditable,
      ),
    );
  }

  Widget buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildTextField('Color', _colorController),
          buildTextField('Plate Number', _plateNumberController),
          buildTextField('Capacity', _capacityController),
          buildTextField('Model', _modelController),
          // buildTextField('License Number', _licenseNumberController),
          // buildTextField('Expiration Date', _expirationDateController),
          // buildTextField('Vehicle Class',
          // _vehicleClassController), // New text field for vehicle class
          ElevatedButton(
            onPressed: _isEditable ? submitAllInformation : null,
            child: const Text('Submit'),
          ),
          ElevatedButton(
            onPressed: toggleEdit,
            child: Text(_isEditable ? 'Disable Editing' : 'Enable Editing'),
          ),
        ],
      ),
    );
  }

  Future<void> submitAllInformation() async {
    if (!_formKey.currentState!.validate()) {
      return; // Prevent submission if the form is not valid
    }

    var carSuccess = await addCarInformation();
    if (carSuccess) {
      saveData();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Car information submitted successfully')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add car information')),
      );
    }
  }

  Future<bool> addCarInformation() async {
    var response = await httpRequest.addCar(
        _colorController.text,
        _plateNumberController.text,
        _capacityController.text,
        _modelController.text);
    print(response);
    if (response[0] == true) {
      return true;
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${response[1]}"),
        ));
      }
      return false;
    }
  }

  void toggleEdit() {
    setState(() {
      _isEditable = !_isEditable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car and License Information'),
      ),
      body: Form(
        key: _formKey,
        child: buildForm(),
      ),
    );
  }
}
