import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/register/register_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordObscured = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();
  var addressController = TextEditingController();
  var genderController = TextEditingController();
  List<DropdownMenuEntry<String>> genders = [
    const DropdownMenuEntry(value: "Male", label: "Male"),
    const DropdownMenuEntry(value: "Female", label: "Female"),
  ];

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    var cubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterUserSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Account Created Successfully'),
              ));
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(appBar: AppBar(title: Text("Register",
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
                        readOnly: false,
                      ),
                    ),
                    Container(
                      width: w * 0.8,
                      margin: EdgeInsets.only(bottom: h * 0.05),
                      child: CustomTextFormField(
                        hint: "Password",
                        controller: passwordController,
                        label: "Password",
                        obscureText: _isPasswordObscured,
                        icon: IconButton(
                            onPressed: () {
                              setState(() {
                                _togglePasswordVisibility();
                              });
                            },
                            icon: Icon(_isPasswordObscured
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        iconColor:
                        _isPasswordObscured ? Color(0xff2a2a2a) : Colors.grey,
                        readOnly: false,
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
                          text: 'Register',
                          onpressed: () async {
                            await cubit.registerUser(
                                emailController.text, passwordController.text)
                                .then((value) => cubit.saveUser(
                                emailController.text, passwordController.text, usernameController.text, addressController.text, genderController.text));
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