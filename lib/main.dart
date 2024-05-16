import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/provider/ride_provider.dart';
import 'package:senior_project_ruccab/provider/user_provider.dart';
import 'package:senior_project_ruccab/splash_screen.dart';
import 'package:senior_project_ruccab/utils/http_req.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPrefenrece;
final httpRequest = HttpRequests();

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
      title: 'Ruccab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
