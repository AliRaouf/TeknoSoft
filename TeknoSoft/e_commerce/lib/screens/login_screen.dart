import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/screens/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/login/login_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordObscured = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Logged in Successfully'),
              ));
          Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar(),));
        }
      },
      builder: (context, state) {
        if(state is LoginLoadingState){
          return Scaffold(
            body:Center(
              child:
              CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(appBar: AppBar(title: Text("Login",
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
                    Container(width: w*0.4,
                      margin: EdgeInsets.only(bottom: h * 0.02),
                      child: Image.asset("assets/images/logo.png"),
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
                        margin: EdgeInsets.only(top: h * 0.1),
                        child: CustomButton(
                          bColor: Colors.white,
                          borderColor: Color(0xff48d861),
                          textStyle: GoogleFonts.openSans(color: Color(
                              0xff48d861), fontSize: 20, fontWeight: FontWeight
                              .w600),
                          screenWidth: w * 0.5,
                          screenHeight: h * 0.075,
                          text: 'Login',
                          onpressed: () async {
                            cubit.signInWithEmail(emailController.text, passwordController.text);
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