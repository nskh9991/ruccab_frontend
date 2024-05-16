import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:senior_project_ruccab/constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController universityIDController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String selectedGender = '';
  String selecteBirthday = '';
  final ImagePicker _picker = ImagePicker(); // instance of image picker
  XFile? _imageFile; // in this variable we are storing the image

  // Focus nodes for text fields
  late FocusNode fullNameFocus;
  late FocusNode phoneNumberFocus;
  late FocusNode universityIDFocus;
  late FocusNode emailFocus;

  @override
  void initState() {
    super.initState();
    fullNameFocus = FocusNode();
    phoneNumberFocus = FocusNode();
    universityIDFocus = FocusNode();
    emailFocus = FocusNode();
  }

  @override
  void dispose() {
    // Dispose focus nodes to avoid memory leaks
    fullNameFocus.dispose();
    phoneNumberFocus.dispose();
    universityIDFocus.dispose();
    emailFocus.dispose();
    super.dispose();
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage: _imageFile == null
                ? const AssetImage("assets/images/profile.png") as ImageProvider
                : FileImage(File(_imageFile!.path)) as ImageProvider,
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: const Icon(
                Icons.camera_alt,
                color: Colors.red,
                size: 28.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Picture",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.camera, color: Colors.red),
                label: const Text("Camera"),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
              ),
              TextButton.icon(
                icon: const Icon(Icons.image, color: Colors.red),
                label: const Text("Gallery"),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source:
          source, // Specify the source: ImageSource.camera or ImageSource.gallery
    );

    setState(() {
      _imageFile = pickedFile; // It's okay for pickedFile to be null here.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 30,
            color: mainColor,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: mainColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageProfile(),
                const SizedBox(
                  height: 20,
                ),
                buildRoundedTextField(
                  hintText: "Enter your Full Name",
                  controller: fullNameController,
                  focusNode: fullNameFocus,
                ),
                const SizedBox(
                  height: 20,
                ),
                buildRoundedTextField(
                  hintText: "Enter your Phone Number",
                  controller: phoneNumberController,
                  focusNode: phoneNumberFocus,
                ),
                const SizedBox(
                  height: 20,
                ),
                buildRoundedTextField(
                  hintText: "Enter your University ID",
                  controller: universityIDController,
                  focusNode: universityIDFocus,
                ),
                const SizedBox(
                  height: 20,
                ),
                buildRoundedTextField(
                  hintText: "Enter your Email",
                  controller: emailController,
                  focusNode: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                PopupMenuButton(
                  color: Colors.white,
                  onSelected: (value) async {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: mainColor,
                        ),
                      ),
                    ),
                    child: Text(
                      selectedGender == ''
                          ? "Enter your Gender"
                          : selectedGender,
                      style: const TextStyle(
                        color: darkGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 'male',
                        child: Text('Male'),
                      ),
                      const PopupMenuItem(
                        value: 'female',
                        child: Text('Female'),
                      ),
                    ];
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Birthday",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        formattedDate != '0000-00-00'
                            ? selecteBirthday = formattedDate
                            : null;
                      });
                    }
                  },
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: mainColor,
                        ),
                      ),
                    ),
                    child: Text(
                      selecteBirthday == '' ? "YYYY-MM-DD" : selecteBirthday,
                      style: const TextStyle(
                        color: darkGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.only(bottom: 40),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: mainColor,
                    ),
                    child: const Text(
                      "Edit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRoundedTextField({
    required String hintText,
    required TextEditingController controller,
    required FocusNode focusNode,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: darkGrey,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: focusNode.hasFocus ? Colors.red : darkGrey,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
