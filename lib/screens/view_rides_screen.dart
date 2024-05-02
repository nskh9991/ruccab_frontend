import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project_ruccab/components/book_ride_component.dart';
import 'package:senior_project_ruccab/constant.dart';

class ViewRidesScreen extends StatefulWidget {
  const ViewRidesScreen({super.key});

  @override
  State<ViewRidesScreen> createState() => _ViewRidesScreenState();
}

class _ViewRidesScreenState extends State<ViewRidesScreen> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text(
          "Closet to you location:",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: mainColor,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: mainColor,
            size: 25,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: mainColor,
              ),
              child: const Icon(
                Icons.menu_sharp,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: loading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "PLEASE WAIT WHILE WE LOOK FOR YOUR DRIVER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const SpinKitFadingCircle(
                  color: darkGrey,
                  size: 70,
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainColor,
                    ),
                    child: const Text(
                      "Cancel Ride",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          : ListView.separated(
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
              itemCount: 7,
              itemBuilder: (context, index) {
                return const BookRideComponent(
                  index: 0,
                );
              },
            ),
    );
  }
}
