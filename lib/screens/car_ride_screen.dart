import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/screens/menu/menu_screen.dart';

import '../constant.dart';
import '../ride/preferences_screen.dart';

class CarRideScreen extends StatefulWidget {
  const CarRideScreen({super.key});

  @override
  State<CarRideScreen> createState() => _CarRideScreenState();
}

class _CarRideScreenState extends State<CarRideScreen> {
  // FocusNode _focusNode = FocusNode();
  // FocusNode _focusNode2 = FocusNode();
  // TextEditingController startController = TextEditingController();
  // TextEditingController universityController = TextEditingController();
  bool _alignment = true;
  String selectedStartLocation = '';
  String selectedUniversityLocation = '';

  List<String> startLocation = [
    'Abo Samra',
    'Mina',
    'Akkar',
    'Sir Denieh',
    'Kalamoun',
    'Koura',
    'Ebbe',
    'Dam w Farz',
  ];

  List<String> universityLocation = [
    'Beirut Arab University(Tripoli)',
    'Beirut Arab University(Beirut)',
    'Beirut Arab University(Debieh)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MenuScreen(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 3,
                    spreadRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.menu,
                size: 30,
                color: mainColor,
              ),
            ),
          ),
        ],
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: const Icon(
        //     Icons.arrow_back_ios,
        //     color: mainColor,
        //     size: 30,
        //   ),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 300,
                  child: Text(
                    "Lets Create Your Ride",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                      width: 100,
                      child: Divider(
                        color: mainColor,
                        thickness: 3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 200,
                  child: Text(
                    'Your address is kept private',
                    style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                      letterSpacing: 0.9,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 25.0), // Add padding to the left
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _alignment = !_alignment;
                          });
                        },
                        child: Icon(
                          Icons.change_circle_outlined,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedCrossFade(
                  duration: const Duration(seconds: 1),
                  firstChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          for (int i = 0; i < startLocation.length; i++)
                            PopupMenuItem(
                              value: startLocation[i],
                              child: Text(startLocation[i]),
                            ),
                        ];
                      },
                      color: Colors.white,
                      onSelected: (value) async {
                        setState(() {
                          selectedStartLocation = value;
                        });
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.15),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  _alignment
                                      ? Icons.adjust_rounded
                                      : Icons.location_on_rounded,
                                  color: mainColor,
                                  size: 20,
                                ),
                                Text(
                                  selectedStartLocation == ''
                                      ? _alignment
                                          ? "Set start location"
                                          : 'Set Destination'
                                      : selectedStartLocation,
                                  style: TextStyle(
                                      color: selectedStartLocation == ""
                                          ? Colors.grey[600]
                                          : darkGrey,
                                      fontSize: 15),
                                ),
                                const Icon(
                                  Icons.my_location,
                                  color: mainColor,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  secondChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          for (int i = 0; i < universityLocation.length; i++)
                            PopupMenuItem(
                              value: universityLocation[i],
                              child: Text(universityLocation[i]),
                            ),
                        ];
                      },
                      color: Colors.white,
                      onSelected: (value) async {
                        setState(() {
                          selectedUniversityLocation = value;
                        });
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.15),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  !_alignment
                                      ? Icons.adjust_rounded
                                      : Icons.location_on_rounded,
                                  color: mainColor,
                                  size: 20,
                                ),
                                Text(
                                    selectedUniversityLocation == ""
                                        ? "University Default Destination"
                                        : selectedUniversityLocation,
                                    style: TextStyle(
                                        color: selectedUniversityLocation == ""
                                            ? Colors.grey[600]
                                            : darkGrey,
                                        fontSize: 15)),
                                const Icon(
                                  Icons.my_location,
                                  color: mainColor,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  crossFadeState: _alignment
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
                const SizedBox(
                  width: 200,
                  child: Divider(
                    height: 2,
                    thickness: 2,
                    color: lightColor,
                  ),
                ),
                AnimatedCrossFade(
                  duration: const Duration(seconds: 1),
                  firstChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          for (int i = 0; i < startLocation.length; i++)
                            PopupMenuItem(
                              value: startLocation[i],
                              child: Text(startLocation[i]),
                            ),
                        ];
                      },
                      color: Colors.white,
                      onSelected: (value) async {
                        setState(() {
                          selectedStartLocation = value;
                        });
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.15),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  _alignment
                                      ? Icons.adjust_rounded
                                      : Icons.location_on_rounded,
                                  color: mainColor,
                                  size: 20,
                                ),
                                Text(
                                  selectedStartLocation == ''
                                      ? _alignment
                                          ? "Set start location"
                                          : 'Set Destination'
                                      : selectedStartLocation,
                                  style: TextStyle(
                                      color: selectedStartLocation == ""
                                          ? Colors.grey[600]
                                          : darkGrey,
                                      fontSize: 15),
                                ),
                                const Icon(
                                  Icons.my_location,
                                  color: mainColor,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  secondChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          for (int i = 0; i < universityLocation.length; i++)
                            PopupMenuItem(
                              value: universityLocation[i],
                              child: Text(universityLocation[i]),
                            ),
                        ];
                      },
                      color: Colors.white,
                      onSelected: (value) async {
                        setState(() {
                          selectedUniversityLocation = value;
                        });
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.15),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  !_alignment
                                      ? Icons.adjust_rounded
                                      : Icons.location_on_rounded,
                                  color: mainColor,
                                  size: 20,
                                ),
                                Text(
                                    selectedUniversityLocation == ""
                                        ? "University Default Destination"
                                        : selectedUniversityLocation,
                                    style: TextStyle(
                                        color: selectedUniversityLocation == ""
                                            ? Colors.grey[600]
                                            : darkGrey,
                                        fontSize: 15)),
                                const Icon(
                                  Icons.my_location,
                                  color: mainColor,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  crossFadeState: !_alignment
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/Map location.png',
                  width: 200,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PreferencesScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
