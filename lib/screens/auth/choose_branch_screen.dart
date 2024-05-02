import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/screens/auth/selection_role_screen.dart';

class ChooseBranchScreen extends StatefulWidget {
  const ChooseBranchScreen({super.key});

  @override
  State<ChooseBranchScreen> createState() => _ChooseBranchScreenState();
}

class _ChooseBranchScreenState extends State<ChooseBranchScreen> {
  List<String> branches = ['Tripoli', 'Debbieh', 'Beirut'];
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/choose_branch.png',
              width: 270,
            ),
            const Text(
              'Welcome, Bau student Choose your branch',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                shrinkWrap: true,
                itemCount: branches.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 300,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selected == index
                                ? mainColor.withOpacity(0.5)
                                : mainColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            branches[index],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                }),

            // SizedBox(
            //   width: 300,
            //   child: GestureDetector(
            //     onTap: () {},
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: mainColor,
            //           borderRadius: BorderRadius.circular(12)),
            //       child: const Padding(
            //         padding: EdgeInsets.symmetric(vertical: 5.0),
            //         child: Text(
            //           'Debbieh',
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.w600,
            //               fontSize: 20),
            //           textAlign: TextAlign.center,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // SizedBox(
            //   width: 300,
            //   child: GestureDetector(
            //     onTap: () {},
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: mainColor,
            //           borderRadius: BorderRadius.circular(12)),
            //       child: const Padding(
            //         padding: EdgeInsets.symmetric(vertical: 5.0),
            //         child: Text(
            //           'Beirut',
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.w600,
            //               fontSize: 20),
            //           textAlign: TextAlign.center,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
                width: 250,
                child: Divider(
                  color: mainColor,
                  height: 2,
                  thickness: 3,
                )),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectionRoleScreen(),
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
                      'Continue',
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
    );
  }
}
