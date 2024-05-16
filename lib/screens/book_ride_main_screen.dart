import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project_ruccab/components/book_ride_component.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/provider/ride_provider.dart';
import 'package:senior_project_ruccab/screens/menu/menu_screen.dart';
import 'package:senior_project_ruccab/screens/view_rides_screen.dart';

class BookRideMainScreen extends StatefulWidget {
  const BookRideMainScreen({super.key});

  @override
  State<BookRideMainScreen> createState() => _BookRideMainScreenState();
}

class _BookRideMainScreenState extends State<BookRideMainScreen> {
  List<String> destinationLocation = [
    'Abo Samra',
    'mina',
    'Akkar',
    'Sir Denieh',
    'Kalamoun',
    'Koura',
    'Ebbe',
    'Dam w Farz',
  ];

  String? selectedDestinationtLocation;

  // FocusNode _focusNode = FocusNode();
  TextEditingController startController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  bool _alignment = false;
  @override
  Widget build(BuildContext context) {
    final rideProvider = Provider.of<RideProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Book a Ride",
          style: TextStyle(
            fontSize: 24,
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
        backgroundColor: Colors.white,
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: mainColor.withOpacity(0.2),
                      ),
                      height: 110,
                    ),
                    SizedBox(
                      height: 110,
                      child: AnimatedAlign(
                        alignment: !_alignment
                            ? Alignment.bottomCenter
                            : Alignment.topCenter,
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 900),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: DropdownButtonFormField<String>(
                              value: selectedDestinationtLocation,
                              items: destinationLocation
                                  .map((location) => DropdownMenuItem<String>(
                                        value: location,
                                        child: Text(
                                          location,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) async {
                                setState(() {
                                  selectedDestinationtLocation = value;
                                });
                                await rideProvider.fetchRidesByDestination(
                                    selectedDestinationtLocation ?? "");
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  _alignment
                                      ? Icons.adjust_rounded
                                      : Icons.location_on_rounded,
                                  color: mainColor,
                                  size: 20,
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[600], fontSize: 15),
                                hintText: _alignment
                                    ? "Set start location"
                                    : 'Set Destination',
                                fillColor: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 110,
                      child: AnimatedAlign(
                        alignment: _alignment
                            ? Alignment.bottomCenter
                            : Alignment.topCenter,
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 900),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextField(
                              controller: universityController,
                              readOnly: true, // Makes the TextField read-only
                              cursorColor:
                                  mainColor, // Set your 'mainColor' variable accordingly
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  !_alignment
                                      ? Icons.adjust_rounded
                                      : Icons.location_on_rounded,
                                  color: mainColor,
                                  size: 20,
                                ),
                                border: InputBorder.none,
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[600], fontSize: 15),
                                hintText: "University Default Destination",
                                fillColor: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 42,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _alignment = !_alignment;
                          });
                        },
                        child: const Icon(
                          Icons.swap_vert_circle,
                          color: mainColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: greyColor),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/wishlist_icon.png',
                        color: Colors.black,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Use Default',
                        style: TextStyle(
                          color: darkGrey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 5,
                    width: 70,
                    decoration: BoxDecoration(
                      color: darkGrey.withOpacity(.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Recommended Rides",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: mainColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 5,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 1.2,
                        width: 160,
                        decoration: BoxDecoration(
                          color: darkGrey.withOpacity(.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    itemCount: rideProvider.rides.data != null
                        ? rideProvider.rides.data!.length
                        : 0,
                    itemBuilder: (context, index) {
                      return BookRideComponent(
                        index: index,
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewRidesScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 70,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mainColor,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Confirm",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_double_arrow_right_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
