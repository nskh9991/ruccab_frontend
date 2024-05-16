// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:senior_project_ruccab/components/book_ride_component.dart';
// import 'package:senior_project_ruccab/constant.dart';

// import '../../provider/user_provider.dart';

// class OnGoingScreen extends StatefulWidget {
//   const OnGoingScreen({super.key});

//   @override
//   State<OnGoingScreen> createState() => _OnGoingScreenState();
// }

// class _OnGoingScreenState extends State<OnGoingScreen> {
//   @override
//   void initState() {
//     super.initState();
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     userProvider.fetchMyRides();
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         elevation: 0,
//         title: const Text(
//           "My Rides ",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             color: mainColor,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(
//             Icons.arrow_back_ios,
//             color: mainColor,
//             size: 30,
//           ),
//         ),
//       ),
//       body: userProvider.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Column(
//               children: List.generate(
//                   userProvider.myRides.data != null
//                       ? userProvider.myRides.data!.length
//                       : 0,
//                   (index) => Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     spreadRadius: 5,
//                                     blurRadius: 7,
//                                     offset: const Offset(
//                                         0, 3), // changes position of shadow
//                                   ),
//                                 ],
//                                 border:
//                                     Border.all(width: 25, color: mainColor)),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                     "From ${userProvider.myRides.data![index].startPoint}"),
//                                 Text(
//                                     "To  ${userProvider.myRides.data![index].destination}"),
//                                 Text(
//                                     "Date  ${userProvider.myRides.data![index].date}"),
//                                 Text(
//                                     "Number of passengers  ${userProvider.myRides.data![index].passengers!.length}"),
//                               ],
//                             )),
//                       )),
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/provider/ride_provider.dart';
import 'package:senior_project_ruccab/screens/menu/accept_passenger_screen.dart';

import '../../provider/user_provider.dart';

class OnGoingScreen extends StatefulWidget {
  const OnGoingScreen({super.key});

  @override
  State<OnGoingScreen> createState() => _OnGoingScreenState();
}

class _OnGoingScreenState extends State<OnGoingScreen> {
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.fetchMyRides();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final rideProvider = Provider.of<RideProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text(
          "My Rides",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: mainColor,
          ),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: mainColor,
            size: 30,
          ),
        ),
      ),
      body: userProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userProvider.myRides.data?.length ?? 0,
              itemBuilder: (context, index) {
                final ride = userProvider.myRides.data![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AcceptPassengerScreen(
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From: ${ride.startPoint}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "To: ${ride.destination}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Date: ${ride.date}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Number of passengers: ${ride.passengers?.length ?? 0}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                            ),
                            Text(
                              "Number of pending passengers: ${ride.pendingPassengers?.length ?? 0}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    var x = await rideProvider
                                        .completeRide("${ride.id}");
                                    print("-===================");
                                    print(x[1]);
                                    Navigator.pop(context);
                                  },
                                  child: Text("ride Completed")),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
