import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/constant.dart';
class ConfirmationDriverComponent extends StatefulWidget {
  const ConfirmationDriverComponent({super.key});

  @override
  State<ConfirmationDriverComponent> createState() =>
      _ConfirmationDriverComponentState();
}

class _ConfirmationDriverComponentState
    extends State<ConfirmationDriverComponent> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 160,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(241, 216, 234, 1.0),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('White Swift',
                        style: TextStyle(
                            color: mainColor, fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 15),
                      child: SizedBox(
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://platform.cstatic-images.com/xlarge/in/v2/stock_photos/9b4509f2-259e-460c-96d7-6bd672414021/4652f3a8-300a-4ddc-9c17-0d4a783b2e5c.png",
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
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'BMW M3',
                      style: TextStyle(color: greyColor),
                    ),
                    Text(' 1234',
                        style: TextStyle(
                            color: darkGrey, fontWeight: FontWeight.w500))
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Row(
                  children: [
                    const Column(
                      children: [
                        Text(
                          'Ahmad',
                          style: TextStyle(
                              color: mainColor, fontWeight: FontWeight.w500),
                        ),
                        Row(children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text('4.5'),
                        ]),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 40,
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
                  ],
                )
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
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20))),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          size: 20,
                          color: greyColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Call Driver',
                          style: TextStyle(color: greyColor, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                color: greyColor,
                height: 50,
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
                      height: 50,
                      decoration: BoxDecoration(
                          color: selected
                              ? mainColor.withOpacity(.4)
                              : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20))),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cancel,
                            size: 20,
                            color: greyColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Cancel Ride',
                            style: TextStyle(color: greyColor, fontSize: 18),
                          ),
                        ],
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
