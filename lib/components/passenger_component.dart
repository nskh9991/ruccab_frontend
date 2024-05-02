import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/constant.dart';

class PassengerComponent extends StatefulWidget {
  const PassengerComponent({super.key});

  @override
  State<PassengerComponent> createState() => _PassengerComponentState();
}

class _PassengerComponentState extends State<PassengerComponent> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(241, 216, 234, 1.0),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
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
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ahmad',
                            style: TextStyle(color: mainColor),
                          ),
                          Icon(
                            Icons.person,
                            color: mainColor,
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.school_sharp,
                          color: mainColor,
                        ),
                        Text(' BAU Tripoli',
                            style: TextStyle(color: greyColor)),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                const Row(children: [
                  Text('4.5'),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                ])
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: double.maxFinite,
            color: greyColor,
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20))),
                    child: const Center(
                      child: Text(
                        'View Details',
                        style: TextStyle(color: darkGrey, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                color: greyColor,
                height: 60,
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: selected
                              ? mainColor.withOpacity(.4)
                              : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20))),
                      child: const Center(
                        child: Text(
                          'Select',
                          style: TextStyle(color: mainColor, fontSize: 18),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


/* when linking:
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:senior_project_ruccab/models/passenger.dart';
import 'package:senior_project_ruccab/constant.dart';

class PassengerComponent extends StatefulWidget {
  final Passenger passenger;

  const PassengerComponent({super.key, required this.passenger});

  @override
  State<PassengerComponent> createState() => _PassengerComponentState();
}

class _PassengerComponentState extends State<PassengerComponent> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(241, 216, 234, 1.0),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: widget.passenger.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Icon(
                        Icons.person,
                        size: 60,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.passenger.name,
                        style: const TextStyle(color: mainColor, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.passenger.university,
                        style: const TextStyle(color: greyColor, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            color: greyColor,
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
                    child: const Center(
                      child: Text(
                        'View Details',
                        style: TextStyle(color: darkGrey, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                color: greyColor,
                height: 60,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: selected ? mainColor.withOpacity(0.4) : Colors.transparent,
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20))),
                    child: const Center(
                      child: Text(
                        'Select',
                        style: TextStyle(color: mainColor, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


  */