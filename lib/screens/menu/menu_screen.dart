import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/components/confirmation_driver_component.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/main.dart';
import 'package:senior_project_ruccab/screens/auth/signin_screen.dart';
import 'package:senior_project_ruccab/screens/menu/car_information_screen.dart';
import 'package:senior_project_ruccab/screens/menu/ongoing_Screen.dart';
import 'package:senior_project_ruccab/screens/menu/profile_screen.dart';
import 'package:senior_project_ruccab/screens/menu/trip_history_screen.dart';
import 'package:senior_project_ruccab/screens/menu/wallet_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 30,
            color: mainColor,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: darkGrey),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/profile.png',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Lara Yassine",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: mainColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "larayassine@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                  color: darkGrey,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 220,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 0.7, color: greyColor),
                  )),
                  child: const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.6,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TripHistoryScreen(),
                      ));
                },
                child: Container(
                  width: 220,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 0.7, color: greyColor),
                  )),
                  child: const Text(
                    "Trip History",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.6,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnGoingScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 220,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 0.7, color: greyColor),
                  )),
                  child: const Text(
                    "Ongoing Trips",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.6,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CarInformationScreen(),
                      ));
                },
                child: Container(
                  width: 220,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 0.7, color: greyColor),
                  )),
                  child: const Text(
                    "Car Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.6,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WalletScreen(),
                      ));
                },
                child: Container(
                  width: 220,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 0.7, color: greyColor),
                  )),
                  child: const Text(
                    "Electronic Wallet",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.6,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  sharedPrefenrece.setString('signed', 'false');
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                    (route) => false,
                  );
                },
                child: Container(
                  width: 200,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 0.7, color: greyColor),
                  )),
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.6,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
