import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/main.dart';
import 'package:senior_project_ruccab/screens/book_ride_main_screen.dart';
import 'package:senior_project_ruccab/screens/car_ride_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionRoleScreen extends StatefulWidget {
  const SelectionRoleScreen({Key? key}) : super(key: key);

  @override
  State<SelectionRoleScreen> createState() => _SelectionRoleScreenState();
}

class _SelectionRoleScreenState extends State<SelectionRoleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String _savedString = "";
  bool _isRoleSelected = false;

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
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectRole() {
    setState(() {
      _isRoleSelected = true;
    });
    _controller.stop();
  }

  void _onRoleButtonTap() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/mapWallpaper.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 10,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: mainColor,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                const Text(
                  "Select Your Role",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 - 100,
            left: MediaQuery.of(context).size.width / 2.25 - 100,
            child: Column(
              children: [
                _buildRoleButton(
                  label: 'Create Ride',
                  image: 'assets/images/driver.png',
                  onTap: () {
                    sharedPrefenrece.setString('signed', 'true');
                    sharedPrefenrece.setString('role', 'driver');
                    _onRoleButtonTap();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CarRideScreen(),
                      ),
                      (route) => false,
                    );
                  },
                ),
                const SizedBox(height: 20),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  opacity: _isRoleSelected ? 0.0 : 1.0,
                  child: Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: RotationTransition(
                      turns:
                          Tween(begin: -0.05, end: 0.05).animate(_controller),
                      child: Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          "OR",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildRoleButton(
                  label: 'Take Ride',
                  image: 'assets/images/passenger.png',
                  onTap: () {
                    sharedPrefenrece.setString('signed', 'true');
                    sharedPrefenrece.setString('role', 'passenger');
                    _onRoleButtonTap(); // Call the method for the animation
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookRideMainScreen(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleButton({
    required String label,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTapDown: (_) => _selectRole(),
      onTapUp: (_) => setState(() => _isRoleSelected = false),
      onTapCancel: () => setState(() => _isRoleSelected = false),
      onTap: onTap,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 600),
        opacity: _isRoleSelected ? 0.0 : 1.0,
        child: Container(
          height: 220,
          width: 270,
          decoration: BoxDecoration(
            color: Colors.white, //ele wara l sura
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
