import 'package:e_commerce/screens/login_screen.dart';
import 'package:e_commerce/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/store/store_cubit.dart';
import '../widgets/custom_button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    StoreCubit.get(context).getItemStream();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                Container(width: w*0.8,
                  margin: EdgeInsets.symmetric(vertical: h * 0.05),
                  child: Image.asset("assets/images/logo.png"),
                ),
                CustomButton(
                  bColor: Colors.white,
                  borderColor: Color(0xff48d861),
                  textStyle: GoogleFonts.openSans(color: Color(0xff48d861),fontSize:24,fontWeight:FontWeight.bold),
                  screenWidth: w * 0.74,
                  screenHeight: h * 0.075,
                  text: 'Login',
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: h * 0.05),
                    child: CustomButton(
                      bColor: Colors.white,
                      borderColor: Color(0xff48d861),
                      textStyle: GoogleFonts.openSans(color: Color(0xff48d861),fontSize:24,fontWeight:FontWeight.bold),
                      screenWidth: w * 0.74,
                      screenHeight: h * 0.075,
                      text: 'Register',
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                    )),
              ]),
            ),
          ),
        );
  }
}
