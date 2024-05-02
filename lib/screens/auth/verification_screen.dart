import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/screens/auth/enable_location_screen.dart';
import 'package:senior_project_ruccab/utils/http_req.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();
  FocusNode _focusNode5 = FocusNode();
  FocusNode _focusNode6 = FocusNode();
  final httpRequest = HttpRequests();
  List<String> codeDigits = [
    '',
    '',
    '',
    '',
    '',
    ''
  ]; // List to store verification code digits

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/otp.png',
                width: 270,
              ),
              const Text(
                'Verification',
                style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                width: 340,
                child: Text(
                  'Verification code has been sent to your email',
                  style: TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      letterSpacing: 0.5),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    height: 64 * 0.60,
                    width: 50 * 0.75,
                    child: TextFormField(
                      focusNode: [
                        _focusNode1,
                        _focusNode2,
                        _focusNode3,
                        _focusNode4,
                        _focusNode5,
                        _focusNode6
                      ][index],
                      onTapOutside: (value) {
                        [
                          _focusNode1,
                          _focusNode2,
                          _focusNode3,
                          _focusNode4,
                          _focusNode5,
                          _focusNode6
                        ][index]
                            .unfocus();
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (newValue) {
                        if (newValue.isNotEmpty) {
                          codeDigits[index] = newValue;
                          if (index < 5) {
                            [
                              _focusNode1,
                              _focusNode2,
                              _focusNode3,
                              _focusNode4,
                              _focusNode5,
                              _focusNode6
                            ][index + 1]
                                .requestFocus();
                          }
                        }
                      },
                      style: const TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                      decoration: const InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 30),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(width: 3, color: lightColor),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 3, color: lightColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 3, color: greyColor),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.maxFinite,
                child: GestureDetector(
                  onTap: () async {
                    var verificationCode = codeDigits.join('');
                    var response = await httpRequest.verificationCode(
                        widget.email, verificationCode);

                    if (response[0] == true) {
                      if (!context.mounted) return;
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EnableLocationScreen(),
                        ),
                        (route) => false,
                      );
                    } else {
                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${response[1]}"),
                      ));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Verify',
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.maxFinite,
                child: GestureDetector(
                  onTap: () async {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: lightColor, width: 2)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                            color: lightColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Need Help! ',
                    style: TextStyle(
                        color: darkGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Contact Us',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
