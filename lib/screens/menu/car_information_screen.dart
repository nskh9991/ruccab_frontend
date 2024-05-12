import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CarInformationScreen extends StatefulWidget {
  const CarInformationScreen({super.key});

  @override
  State<CarInformationScreen> createState() => _CarInformationScreenState();
}

class _CarInformationScreenState extends State<CarInformationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _plateNumberController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _licenseNumberController =
      TextEditingController();
  final TextEditingController _expirationDateController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isEditable = true;
  String url = "https://ruccab-backend.onrender.com";

// Function to load data

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    loadSavedData();
    setupListeners();
  }

  void setupListeners() {
    _colorController.addListener(() => saveData());
    _plateNumberController.addListener(() => saveData());
    _capacityController.addListener(() => saveData());
    _modelController.addListener(() => saveData());
    _licenseNumberController.addListener(() => saveData());
    _expirationDateController.addListener(() => saveData());
  }

  Future<void> loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _colorController.text = prefs.getString('carColor') ?? '';
    _plateNumberController.text = prefs.getString('carPlateNumber') ?? '';
    _capacityController.text = prefs.getString('carCapacity') ?? '';
    _modelController.text = prefs.getString('carModel') ?? '';
    _licenseNumberController.text = prefs.getString('licenseNumber') ?? '';
    _expirationDateController.text =
        prefs.getString('licenseExpirationDate') ?? '';
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('carColor', _colorController.text);
    await prefs.setString('carPlateNumber', _plateNumberController.text);
    await prefs.setString('carCapacity', _capacityController.text);
    await prefs.setString('carModel', _modelController.text);
    await prefs.setString('licenseNumber', _licenseNumberController.text);
    await prefs.setString(
        'licenseExpirationDate', _expirationDateController.text);
  }

  @override
  void dispose() {
    // Remove listeners when the widget is disposed
    _colorController.removeListener(() => saveData());
    _plateNumberController.removeListener(() => saveData());
    _capacityController.removeListener(() => saveData());
    _modelController.removeListener(() => saveData());
    _licenseNumberController.removeListener(() => saveData());
    _expirationDateController.removeListener(() => saveData());

    _colorController.dispose();
    _plateNumberController.dispose();
    _capacityController.dispose();
    _modelController.dispose();
    _licenseNumberController.dispose();
    _expirationDateController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Widget buildCarTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildTextField('Color', _colorController),
          buildTextField('Plate Number', _plateNumberController),
          buildTextField('Capacity', _capacityController),
          buildTextField('Model', _modelController),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _tabController.animateTo(1);
              }
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }

  Widget buildLicenseTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildTextField('License Number', _licenseNumberController),
          buildTextField('Expiration Date', _expirationDateController),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                submitAllInformation();
              }
            },
            child: Text('Done'),
          ),
          ElevatedButton(
            onPressed: toggleEdit,
            child: Text('Enable Editing'),
          ),
        ],
      ),
    );
  }

  Future<void> submitAllInformation() async {
    if (_isEditable) {
      // Attempt to add car information
      bool carSuccess = await addCarInformation();
      if (carSuccess) {
        // Proceed only if car info is successfully added
        bool licenseSuccess = await addLicenseInformation();
        if (licenseSuccess) {
          // If license info also added successfully
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Car and license information submitted successfully')),
          );
          _tabController.animateTo(0); // Go back to the car tab
        } else {
          // If license information failed to add
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add license information')),
          );
        }
      } else {
        // If car information failed to add
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add car information')),
        );
      }

      // Toggle editing back off if needed
      toggleEdit();
    }
  }

  Future<bool> addCarInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessTokenKey');

    final response = await http.post(
      Uri.parse('$url/cars'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'color': _colorController.text,
        'plateNumber': _plateNumberController.text,
        'capacity': _capacityController.text,
        'model': _modelController.text,
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Car added successfully')),
      );
      return true; // Indicates success
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add car: ${response.body}')),
      );
      return false; // Indicates failure
    }
  }

  Future<bool> addLicenseInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessTokenKey');

    final response = await http.post(
      Uri.parse('$url/licenses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'licenseNumber': _licenseNumberController.text,
        'expirationDate': _expirationDateController.text,
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('License added successfully')),
      );
      return true; // Indicates success
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add license: ${response.body}')),
      );
      return false; // Indicates failure
    }
  }

  void toggleEdit() {
    setState(() {
      _isEditable = !_isEditable;
    });
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car and License Information'),
      ),
      body: Form(
        key: _formKey,
        child: TabBarView(
          controller: _tabController,
          children: [
            buildCarTab(),
            buildLicenseTab(),
          ],
        ),
      ),
    );
  }
}
