import 'package:e_commerce/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/register/register_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var addressController = TextEditingController();
  var genderController = TextEditingController();
  List<DropdownMenuEntry<String>> genders = [
    const DropdownMenuEntry(value: "Male", label: "Male"),
    const DropdownMenuEntry(value: "Female", label: "Female"),
  ];
  @override
  Widget build(BuildContext context) {
    var cubit = UserCubit.get(context);
    emailController.text=cubit.email??"";
    usernameController.text=cubit.userName??"";
    addressController.text=cubit.address??"";
    genderController.text=cubit.gender??"";
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(appBar: AppBar(title: Text("View Profile",
          style: GoogleFonts.openSans(
              color: Color(0xff2a2a2a), fontWeight: FontWeight.w500),),),
          backgroundColor: const Color(0xfffafafa),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: w * 0.8,
                      margin: EdgeInsets.only(bottom: h * 0.05),
                      child: CustomTextFormField(
                        hint: "UserName",
                        controller: usernameController,
                        label: "UserName",
                        obscureText: false,
                        readOnly: false,
                      ),
                    ),
                    Container(
                      width: w * 0.8,
                      margin: EdgeInsets.only(bottom: h * 0.05),
                      child: CustomTextFormField(
                        hint: "Email",
                        controller: emailController,
                        label: "Email",
                        obscureText: false,
                        readOnly: true,
                      ),
                    ),
                    Container(
                      width: w * 0.8,
                      margin: EdgeInsets.only(bottom: h * 0.05),
                      child: CustomTextFormField(
                        hint: "Address",
                        controller: addressController,
                        label: "Address",
                        obscureText: false,
                        readOnly: false,
                      ),
                    ),
                    DropdownMenu<String>(
                        width: w * 0.8,
                        inputDecorationTheme: InputDecorationTheme(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            constraints:
                            BoxConstraints(maxHeight: h * 0.075),
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.black))),
                        label: Text(
                          "Gender",
                          style: GoogleFonts.itim(
                              fontSize: 18, color: const Color(0xff48d681)),
                        ),
                        controller: genderController,
                        dropdownMenuEntries: genders,
                        onSelected: (value) {
                          genderController.text = value!;
                          print(genderController.text);
                        }),
                    Container(
                        margin: EdgeInsets.only(top: h * 0.1),
                        child: CustomButton(
                          bColor: Colors.white,
                          borderColor: Color(0xff48d861),
                          textStyle: GoogleFonts.openSans(color: Color(
                              0xff48d861), fontSize: 20, fontWeight: FontWeight
                              .w600),
                          screenWidth: w * 0.5,
                          screenHeight: h * 0.075,
                          text: 'Edit',
                          onpressed: () async {
                           await cubit.updateUserData(usernameController.text, genderController.text, addressController.text);
                          },
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}