import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project_ruccab/components/book_ride_component.dart';
import 'package:senior_project_ruccab/components/confirmation_driver_component.dart';
import 'package:senior_project_ruccab/components/history_component.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/provider/ride_provider.dart';
import 'package:senior_project_ruccab/provider/user_provider.dart';
import 'package:senior_project_ruccab/screens/auth/selection_role_screen.dart';
import 'package:senior_project_ruccab/screens/book_ride_main_screen.dart';
import 'package:senior_project_ruccab/screens/menu/trip_history_screen.dart';
import 'package:senior_project_ruccab/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPrefenrece;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefenrece = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        //hon mn3rf w mnzid ad ma bdna provider w kl ma nzid class provider lzm nzido hon ta ymshi 7al ysht8l
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => RideProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
      ),
      home: SelectionRoleScreen(),
    );
  }
}
