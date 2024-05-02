import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/screens/confirm_ride_screen.dart';

import 'constant.dart';

class RideDetails extends StatefulWidget {
  const RideDetails({super.key, required this.index});
  final int index;
  @override
  State<RideDetails> createState() => _RideDetailsState();
}

class _RideDetailsState extends State<RideDetails> {
  int gender = 0;
  int smoke = 1;
  int food = 1;
  int pets = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
        child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: mainColor,
                        size: 30,
                      ),
                    ),
                    const Text(
                      "Ride details:",
                      style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 28),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: SizedBox(
                    width: 120,
                    child: Text(
                      "You can only view the details",
                      style: TextStyle(
                          color: greyColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg",
                            fit: BoxFit.cover,
                            // width: double.maxFinite,
                            placeholder: (context, url) {
                              return const Icon(
                                Icons.person,
                                size: 60,
                              );
                            },
                            errorWidget: (context, url, error) {
                              return const Icon(
                                Icons.person,
                                size: 60,
                              );
                            },
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            Text(
                              'Ahmad',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: mainColor),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("4.5",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Gender:",
                  style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: gender,
                          onChanged: (int? value) {
                            setState(() {});
                          },
                          activeColor: greyColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return greyColor;
                          }),
                        ),
                        const Text(
                          'Male',
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: gender,
                          onChanged: (int? value) {
                            setState(() {});
                          },
                          activeColor: greyColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return greyColor;
                          }),
                        ),
                        const Text(
                          'Female',
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: gender,
                          onChanged: (int? value) {
                            setState(() {});
                          },
                          activeColor: greyColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return greyColor;
                          }),
                        ),
                        const Text(
                          "Doesn't matter",
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
                const Text(
                  "Smoking:",
                  style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: smoke,
                          onChanged: (int? value) {
                            setState(() {});
                          },
                          activeColor: greyColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return greyColor;
                          }),
                        ),
                        const Text(
                          'Allowed',
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: smoke,
                          onChanged: (int? value) {
                            setState(() {});
                          },
                          activeColor: greyColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return greyColor;
                          }),
                        ),
                        const Text(
                          "Not allowed",
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
                const Text(
                  "Pets:",
                  style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: pets,
                          onChanged: (int? value) {
                            setState(() {});
                          },
                          activeColor: greyColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return greyColor;
                          }),
                        ),
                        const Text(
                          'Allowed',
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: pets,
                          onChanged: (int? value) {
                            setState(() {});
                          },
                          activeColor: greyColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return greyColor;
                          }),
                        ),
                        const Text(
                          "Not allowed",
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
                const Text(
                  "Food:",
                  style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: food,
                          onChanged: (int? value) {
                            setState(() {});
                          },
                          activeColor: greyColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return greyColor;
                          }),
                        ),
                        const Text(
                          'Allowed',
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: food,
                          onChanged: (int? value) {
                            setState(() {});
                          },
                          activeColor: greyColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return greyColor;
                          }),
                        ),
                        const Text(
                          "Not allowed",
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  "Capacity:",
                  style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Passenger:",
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "2",
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Storage:",
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: SizedBox(
                        width: 200,
                        child: Divider(
                          thickness: 2,
                        ))),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(.4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/car_icon.png',
                        width: 80,
                        height: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Al shifaa street',
                            style: TextStyle(
                                color: darkGrey, fontWeight: FontWeight.w600)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '8 mins',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '0 Passengers',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                    child: SizedBox(
                        width: 170,
                        child: Divider(
                          thickness: 2,
                        ))),
                const SizedBox(
                  height: 30,
                ),
                widget.index == 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300,
                            child: GestureDetector(
                              onTap: () async {
                                await showModalBottomSheet(
                                  enableDrag: true,
                                  isDismissible: true,
                                  backgroundColor: Colors.white,
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (final BuildContext context) =>
                                      StatefulBuilder(
                                    builder: (final context, final setState) =>
                                        Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      decoration: BoxDecoration(
                                        color: mainColor.withOpacity(0.05),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 8,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              "Trip Cost",
                                              style: TextStyle(
                                                  color: mainColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 28),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            LayoutBuilder(
                                              builder: (BuildContext context,
                                                  BoxConstraints constraints) {
                                                final boxWidth = constraints
                                                    .constrainWidth();
                                                const dashWidth = 10.0;
                                                const dashHeight = 2.0;
                                                final dashCount = (boxWidth /
                                                        (1.3 * dashWidth))
                                                    .floor();
                                                return Flex(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  direction: Axis.horizontal,
                                                  children: List.generate(
                                                      dashCount, (_) {
                                                    return const SizedBox(
                                                      width: dashWidth,
                                                      height: dashHeight,
                                                      child: DecoratedBox(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    lightColor),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              "\$6.00",
                                              style: TextStyle(
                                                  color: mainColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 30),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            LayoutBuilder(
                                              builder: (BuildContext context,
                                                  BoxConstraints constraints) {
                                                final boxWidth = constraints
                                                    .constrainWidth();
                                                const dashWidth = 10.0;
                                                const dashHeight = 2.0;
                                                final dashCount = (boxWidth /
                                                        (1.3 * dashWidth))
                                                    .floor();
                                                return Flex(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  direction: Axis.horizontal,
                                                  children: List.generate(
                                                      dashCount, (_) {
                                                    return const SizedBox(
                                                      width: dashWidth,
                                                      height: dashHeight,
                                                      child: DecoratedBox(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    lightColor),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.adjust_rounded,
                                                    color: mainColor,
                                                  ),
                                                  Text(
                                                    'Al mina ,BAU',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 31.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 80,
                                                    child: LayoutBuilder(
                                                      builder:
                                                          (BuildContext context,
                                                              BoxConstraints
                                                                  constraints) {
                                                        const dashWidth = 2.0;
                                                        const dashHeight = 5.0;
                                                        const dashCount = 10;
                                                        return Flex(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          direction:
                                                              Axis.vertical,
                                                          children:
                                                              List.generate(
                                                                  dashCount,
                                                                  (_) {
                                                            return const Column(
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      dashWidth,
                                                                  height:
                                                                      dashHeight,
                                                                  child:
                                                                      DecoratedBox(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                mainColor),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2,
                                                                )
                                                              ],
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_rounded,
                                                    color: mainColor,
                                                  ),
                                                  Text(
                                                    'Tripoli, Abu Samra, Marj Zouhour',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            LayoutBuilder(
                                              builder: (BuildContext context,
                                                  BoxConstraints constraints) {
                                                final boxWidth = constraints
                                                    .constrainWidth();
                                                const dashWidth = 10.0;
                                                const dashHeight = 2.0;
                                                final dashCount = (boxWidth /
                                                        (1.3 * dashWidth))
                                                    .floor();
                                                return Flex(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  direction: Axis.horizontal,
                                                  children: List.generate(
                                                      dashCount, (_) {
                                                    return SizedBox(
                                                      width: dashWidth,
                                                      height: dashHeight,
                                                      child: DecoratedBox(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: mainColor
                                                                    .withOpacity(
                                                                        .5)),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, right: 50),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "\$6.00",
                                                    style: TextStyle(
                                                        color: mainColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ConfirmRideScreen(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    color: mainColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: const Center(
                                                  child: Text(
                                                    'Next',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    'Book Now',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            )),
      ),
    );
  }
}
