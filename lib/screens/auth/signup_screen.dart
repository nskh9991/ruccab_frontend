import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/screens/auth/verification_screen.dart';
import 'package:senior_project_ruccab/utils/http_req.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<String> gender = [
    'male',
    'female',
  ];
  String? selectedGender;

  List<String> faculty = [
    'Science',
    'Business',
    'Design and built environment',
    'Engineering'
        'Health Science'
  ];

  String? selectedFaculty;

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController universityIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode universityIDFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  final httpRequest = HttpRequests();

  final _formKey = GlobalKey<FormState>();
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
                  const SizedBox(height: 50.0), // Keeping the height at 30.0
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 40.0), // Adding left padding instead of right
                    child: Align(
                      alignment: Alignment
                          .centerLeft, // Changing the alignment to left
                      child: Text(
                        "Sign Up",
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
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.person,
                              color: mainColor,
                              size: 35,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: firstName,
                                focusNode: firstNameFocus,
                                obscureText: false,
                                validator: (value) {},
                                onTapOutside: (event) {
                                  firstNameFocus.unfocus();
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
                                  hintText: "Enter your first name",
                                  hintStyle: TextStyle(
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
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.person_2,
                              color: mainColor,
                              size: 35,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: lastName,
                                focusNode: lastNameFocus,
                                obscureText: false,
                                validator: (value) {},
                                onTapOutside: (event) {
                                  lastNameFocus.unfocus();
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
                                  hintText: "Enter your last name",
                                  hintStyle: TextStyle(
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
                        const SizedBox(
                          height: 15,
                        ),
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
                              Icons.phone,
                              color: mainColor,
                              size: 35,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: phoneController,
                                focusNode: phoneFocus,
                                validator: (value) {},
                                onTapOutside: (event) {
                                  phoneFocus.unfocus();
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
                                  hintText: "Enter your phone number",
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
                                focusNode: passwordFocus,
                                obscureText: true,
                                validator: (value) {},
                                onTapOutside: (event) {
                                  passwordFocus.unfocus();
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
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(
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
                                controller: confirmPasswordController,
                                focusNode: confirmPasswordFocus,
                                obscureText: true,
                                validator: (value) {},
                                onTapOutside: (event) {
                                  confirmPasswordFocus.unfocus();
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
                                  hintText: "Enter your confirm Password",
                                  hintStyle: TextStyle(
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
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.transgender_sharp,
                              color: mainColor,
                            ),
                            const SizedBox(
                                width: 10), // Space between icon and dropdown
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                },
                                items: gender.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  labelText: 'Gender',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons
                                  .school, // Icon representing education/faculty
                              color: mainColor,
                            ),
                            const SizedBox(
                                width: 10), // Space between icon and dropdown
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: selectedFaculty,
                                onChanged: (value) {
                                  setState(() {
                                    selectedFaculty = value!;
                                  });
                                },
                                items: faculty.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  labelText: 'Faculty',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "By signing up, you're agree to our ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: darkGrey,
                          ),
                        ),
                        TextSpan(
                          text: "Terms & Conditions ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                        TextSpan(
                          text: "and ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: darkGrey,
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var response = await httpRequest.signUp(
                          emailController.text,
                          passwordController.text,
                          firstName.text,
                          lastName.text,
                          selectedGender!,
                          selectedFaculty!,
                          confirmPasswordController.text,
                          phoneController.text
                          // p.text,
                          );
                      print(response);
                      if (response[0] == true) {
                        if (!context.mounted) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationScreen(
                              email: emailController.text,
                            ),
                          ),
                        );
                      } else {
                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("${response[1]}"),
                        ));
                      }
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
                        "Continue",
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
                        "Joined us before? ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: darkGrey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
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
