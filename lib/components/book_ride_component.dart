import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/ride_details.dart';

class BookRideComponent extends StatelessWidget {
  const BookRideComponent({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
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
            child: Image.asset("assets/images/car_icon.png"),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Abo Samra",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 17,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/clock_icon.png',
                          height: 15,
                          color: darkGrey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "5 mins",
                          style: TextStyle(
                            fontSize: 12,
                            color: darkGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: darkGrey,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "3",
                          style: TextStyle(
                            fontSize: 12,
                            color: darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RideDetails(index: index),
                      ),
                    );
                  },
                  child: Container(
                    height: 25,
                    width: 110,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: mainColor,
                    ),
                    child: const Text(
                      "Open Details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
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





//bs neje bdna n3ml link: 
/* 

import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/models/trip.dart';
import 'package:senior_project_ruccab/ride_details.dart';


//display brief overview of a ride y3ne hay l moraba3
//ele feya info l ride 

//stateless it builds itself mn l data ele bel arguments bs 
class BookRideComponent extends StatelessWidget {
  const BookRideComponent({
    super.key,
    required this.trip,
    required this.index,
  });

  final Trip trip;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
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
            child: Image.asset("assets/images/car_icon.png"),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.destination,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 17,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/clock_icon.png',
                          height: 15,
                          color: darkGrey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          trip.duration,
                          style: const TextStyle(
                            fontSize: 12,
                            color: darkGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: darkGrey,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${trip.passengerCount}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RideDetails(index: index),
                      ),
                    );
                  },
                  child: Container(
                    height: 25,
                    width: 110,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: mainColor,
                    ),
                    child: const Text(
                      "Open Details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
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

*/