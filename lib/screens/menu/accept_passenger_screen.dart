import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project_ruccab/provider/user_provider.dart';

class AcceptPassengerScreen extends StatelessWidget {
  final int index;
  const AcceptPassengerScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Pending Passengers"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: List.generate(
                userProvider.myRides.data![index].pendingPassengers!.length,
                (i) => Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Passenger id ${userProvider.myRides.data![index].pendingPassengers![i]}"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  var res = await userProvider
                                      .AcceptOrRejectPassenger(
                                          userProvider.myRides.data![index].id!,
                                          userProvider.myRides.data![index]
                                              .pendingPassengers![i],
                                          "accept");
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("${res[1]}"),
                                  ));
                                  Navigator.pop(context);
                                },
                                child: const Text("accept")),
                            ElevatedButton(
                                onPressed: () async {
                                  var res = await userProvider
                                      .AcceptOrRejectPassenger(
                                    userProvider.myRides.data![index].id!,
                                    userProvider.myRides.data![index]
                                        .pendingPassengers![i],
                                    "reject",
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("${res[1]}"),
                                  ));
                                  Navigator.pop(context);
                                },
                                child: const Text("reject")),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
