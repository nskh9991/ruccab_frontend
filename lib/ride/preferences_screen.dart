import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senior_project_ruccab/models/ride.dart';
import 'package:senior_project_ruccab/ride/passengers_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';

String url = "https://ruccab-backend.onrender.com";

class PreferencesScreen extends StatefulWidget {
  final String startLocation;
  final String endLocation;

  const PreferencesScreen({
    super.key,
    required this.startLocation,
    required this.endLocation,
  });
  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String gender = "Unspecified";
  String displayTime = 'Select Time'; // For displaying the time
  DateTime selectedDateTime = DateTime.now();
  bool smoke = false;
  bool food = false;
  bool pets = false;
  int passengerCount = 0;
  double _timeOpacity = 1.0;
  FocusNode passengerFocusNode = FocusNode();
  TextEditingController passengerCountController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  FocusNode detailsFocusNode = FocusNode();
  bool isFieldFocused = false;

  
  String _savedString = "";
  Future<void> _loadSavedString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedString = prefs.getString('accessTokenKey') ?? '';
      print("1 $_savedString");
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSavedString();
    detailsFocusNode.addListener(() {
      setState(() {
        isFieldFocused = detailsFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    detailsController.dispose();
    detailsFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 50),
            _buildTimePicker(),
            const SizedBox(height: 15),
            _buildToggleSection("Smoking Allowed:", smoke,
                (value) => setState(() => smoke = value)),
            const SizedBox(height: 15),
            _buildToggleSection(
                "Pets Allowed:", pets, (value) => setState(() => pets = value)),
            const SizedBox(height: 15),
            _buildToggleSection(
                "Food Allowed:", food, (value) => setState(() => food = value)),
            const SizedBox(height: 15),
            _buildGenderSelector(),
            const SizedBox(height: 15),
            _buildPassengerCapacityInput(),
            const SizedBox(height: 15),
            buildAnimatedDetailsField(),
            const SizedBox(height: 15),
            _buildConfirmationButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: mainColor, size: 30),
        ),
        const Text(
          "Set Your Preferences:",
          style: TextStyle(
              color: mainColor, fontWeight: FontWeight.w600, fontSize: 30),
        ),
      ],
    );
  }

  Widget _buildGenderSelector() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text("Gender:",
              style: TextStyle(
                  color: mainColor, fontWeight: FontWeight.w600, fontSize: 20)),
        ),
        Expanded(
          flex: 2,
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 2),
                  borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.white,
            ),
            value: gender,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.red),
            style: TextStyle(color: mainColor, fontSize: 18),
            onChanged: (newValue) =>
                setState(() => gender = newValue ?? gender),
            items: ["Male", "Female", "Unspecified"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleSection(
      String title, bool value, ValueChanged<bool> onChanged) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title,
          style: TextStyle(
              color: mainColor, fontWeight: FontWeight.w600, fontSize: 20)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: mainColor,
      ),
    );
  }

  Widget _buildDetailsField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Destination Details..',
        hintStyle: TextStyle(
            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(12)),
      ),
      cursorColor: mainColor,
      maxLines: 2,
      controller: detailsController,
    );
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDateTime),
    );
    if (pickedTime != null && mounted) {
      setState(() {
        // Update the selectedDateTime with the new time
        selectedDateTime = DateTime(
          selectedDateTime.year,
          selectedDateTime.month,
          selectedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        // Update the displayTime for the UI
        displayTime = pickedTime.format(context);
        // Reset opacity animation
        _timeOpacity = 1.0;
      });
    }
  }

// Widget that builds the time picker section with an animated opacity.
  Widget _buildTimePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Time of Departure:",
            style: TextStyle(
                color: mainColor, fontWeight: FontWeight.w600, fontSize: 20)),
        AnimatedOpacity(
          opacity: _timeOpacity,
          duration: const Duration(milliseconds: 500),
          child: ElevatedButton(
            onPressed: _selectTime,
            style: ElevatedButton.styleFrom(foregroundColor: mainColor),
            child: Text(displayTime,
                style:
                    TextStyle(color: mainColor, fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmationButton() {
    return Center(
      child: ElevatedButton(
        onPressed: createRide, // This should trigger the function defined above
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        ),
        child: const Text("Create Ride",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20)),
      ),
    );
  }

  Future<void> createRide() async {
    if (_savedString.isEmpty) {
//
    } else {
      Ride ride = Ride(
        rideId:
            'unique_ride_id', // This should be generated or fetched as needed
        driverId:
            'driver_specific_id', // Set appropriately based on your application's context
        time: selectedDateTime,
        startLocation: widget.startLocation,
        endLocation: widget.endLocation,
        smokeAllowed: smoke,
        petsAllowed: pets,
        foodAllowed: food,
        passengerCount: passengerCount,
        gender: gender,
      );

      // Serialize the Ride object and send it to the backend
      try {
        var response = await http.post(
          Uri.parse('$url/api/ride/rides'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
                'Bearer $_savedString', // Include the token in the Authorization header
          },
          body: jsonEncode(ride.toJson()),
        );

        if (response.statusCode == 200) {
          print('Ride created successfully');
        } else {
          print('Failed to create ride: ${response.body}');
        }
      } catch (e) {
        print('Error creating ride: $e');
      }
    }
  }

  void _showConfirmationDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black45.withOpacity(0.5),
      barrierLabel: 'Dismiss', // Required label for accessibility
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: mainColor, // Use main color for consistency
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle_outline, size: 60, color: Colors.white),
                SizedBox(height: 20),
                Text(
                  "Confirmation",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Your ride has been confirmed",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PassengersScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 95, 3, 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text("OK", style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
          child: child,
        );
      },
    );
  }

  Widget _buildPassengerCapacityInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  " Number Of Passengers:",
                  style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 40,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    focusNode: passengerFocusNode,
                    cursorColor: mainColor,
                    controller: passengerCountController,
                    onTapOutside: (value) {
                      passengerFocusNode.unfocus();
                    },
                    maxLength: 2,
                    style: const TextStyle(
                        color: mainColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(counter: SizedBox()),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          passengerCount = int.parse(value);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildAnimatedDetailsField() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      decoration: BoxDecoration(
        // hay l txtfield box
        border: Border.all(
          color: isFieldFocused
              ? Color.fromARGB(255, 162, 5, 5)
              : Colors.grey, // Animated color change
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        focusNode: detailsFocusNode,
        controller: detailsController,
        cursorColor: mainColor,
        maxLines: 2,
        decoration: InputDecoration(
          labelText: 'Destination Details..',
          labelStyle: TextStyle(
            color: isFieldFocused
                ? mainColor
                : Color.fromARGB(255, 139, 132, 132), // Change label color
          ),
          border: InputBorder.none, // Remove default underline border
          contentPadding: EdgeInsets.all(10),
        ),
        style: TextStyle(color: mainColor, fontSize: 16),
      ),
    );
  }
}
