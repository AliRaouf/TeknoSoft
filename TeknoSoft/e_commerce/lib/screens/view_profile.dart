import 'package:e_commerce/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/register/register_cubit.dart';
import '../widgets/custom_form_field.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var addressController = TextEditingController();
  var genderController = TextEditingController();
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
                        readOnly: true,
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
                        readOnly: true,
                      ),
                    ),
                    Container(
                      width: w * 0.8,
                      margin: EdgeInsets.only(bottom: h * 0.05),
                      child: CustomTextFormField(
                        hint: "Gender",
                        controller: genderController,
                        label: "Gender",
                        obscureText: false,
                        readOnly: true,
                      ),
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