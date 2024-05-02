import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senior_project_ruccab/ride/passengers_screen.dart';
import '../constant.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String gender = "Unspecified";
  String time = 'Select Time';
  bool smoke = false;
  bool food = false;
  bool pets = false;
  int passengerCount = 0;
  double _timeOpacity = 1.0;
  FocusNode passengerFocusNode = FocusNode();
  TextEditingController passengerController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  FocusNode detailsFocusNode = FocusNode();
  bool isFieldFocused = false;

  @override
  void initState() {
    super.initState();
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

  Widget _buildConfirmationButton() {
    return Center(
      child: ElevatedButton(
        onPressed: _showConfirmationDialog,
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        ),
        child: const Text("Next",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20)),
      ),
    );
  }
Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && mounted) {
      setState(() {
        // Set opacity to 0 to start the fade-out animation
        _timeOpacity = 0.0;
      });
      // Allow some time for the fade-out animation to complete
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        // Update the time and start the fade-in animation
        time = pickedTime.format(context);
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
          opacity: _timeOpacity, // Use the animated opacity for the fade effect
          duration:
              const Duration(milliseconds: 500), // Duration of the animation
          child: ElevatedButton(
            onPressed: _selectTime,
            style: ElevatedButton.styleFrom(foregroundColor: mainColor),
            child: Text(time,
                style:
                    TextStyle(color: mainColor, fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
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
                SizedBox(width: 20,),
                SizedBox(
                  width: 40,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    focusNode: passengerFocusNode,
                    cursorColor: mainColor,
                    controller: passengerController,
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
