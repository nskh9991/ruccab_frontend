import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/screens/auth/enable_location_screen.dart';
import 'package:senior_project_ruccab/screens/auth/selection_role_screen.dart';
import 'package:senior_project_ruccab/screens/auth/signup_screen.dart';
import 'package:senior_project_ruccab/screens/auth/verification_screen.dart';
import 'package:senior_project_ruccab/utils/http_req.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool obscure = false;
  final httpRequest = HttpRequests();
  final _formKey = GlobalKey<FormState>();

  Future<void> _saveString(String value, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  Center(
                    child: Image.asset(
                      'assets/images/Girl using the fingerprint scanner in her phone.png',
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.email_outlined,
                              color: mainColor,
                              size: 35,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: emailController,
                                focusNode: emailFocus,
                                validator: (value) {},
                                onTapOutside: (event) {
                                  emailFocus.unfocus();
                                },
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: 1.5,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: 0.7,
                                    ),
                                  ),
                                  hintText: "Enter University email",
                                  hintStyle: TextStyle(
                                    color: darkGrey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.lock_clock,
                              color: mainColor,
                              size: 35,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: obscure,
                                focusNode: passwordFocus,
                                validator: (value) {},
                                onTapOutside: (event) {
                                  passwordFocus.unfocus();
                                },
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscure = !obscure;
                                      });
                                    },
                                    icon: obscure
                                        ? const Icon(
                                            Icons.visibility_off,
                                            color: greyColor,
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            color: greyColor,
                                          ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: 1.5,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                      width: 0.7,
                                    ),
                                  ),
                                  hintText: "Enter your Password",
                                  hintStyle: const TextStyle(
                                    color: darkGrey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  GestureDetector(
                    onTap: () async {
                      print("login clicked");
                      print("${emailController.text}");
                      var response = await httpRequest.login(
                          emailController.text, passwordController.text);

                      if (response[0] == false) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("${response[1].toString()}"),
                        ));
                      } else {
                        _saveString(response[1].toString(), "accessTokenKey");

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectionRoleScreen()),
                        );
                      }
                      /*  if (response[0] == true) {
                        if (!context.mounted) return;

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SelectionRoleScreen()),
                          (route) => false,
                        );
                      } else {
                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("${response[1]}"),
                        ));

                        if (response[1] != "User not verified") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectionRoleScreen()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerificationScreen(
                                    email: emailController.text)),
                          );
                        }
                      }*/
                    },
                    child: Container(
                      height: 45,
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: mainColor,
                      ),
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "New Here? ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: darkGrey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
