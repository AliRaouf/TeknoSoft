import 'package:e_commerce/screens/view_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.openSans(),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(children: [
              ElevatedButton(
                style: ButtonStyle(elevation: MaterialStatePropertyAll(0)),
                onPressed: () {
                  pushWithoutNavBar(context, MaterialPageRoute(builder: (context) => ViewProfile(),));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 28,
                        color: Color(0xff2a2a2a),
                      ),
                      Text(
                        "  View Profile",
                        style: GoogleFonts.openSans(
                            fontSize: 18, color: Color(0xff2a2a2a)),
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(elevation: MaterialStatePropertyAll(0)),
                onPressed: () {
                  pushWithoutNavBar(context, MaterialPageRoute(builder: (context) => EditProfile(),));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(children: [
                    Icon(Icons.edit, size: 28,color: Color(0xff2a2a2a)),
                    Text(
                      "  Edit Profile",
                      style: GoogleFonts.openSans(fontSize: 18,color: Color(0xff2a2a2a)),
                    )
                  ]),
                ),
              )
            ])));
  }
}
