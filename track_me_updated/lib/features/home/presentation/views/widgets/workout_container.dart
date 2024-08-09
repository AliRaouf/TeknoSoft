import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:track_me_updated/core/styles.dart';

class WorkoutContainer extends StatelessWidget {
  const WorkoutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: Theme.of(context).brightness == Brightness.dark
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xff1E1E1E)
              : const Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.04),
      height: MediaQuery.sizeOf(context).height * 0.2,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Work out like a pro\nathlete",
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    context.go('/settings');
                  },
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey.shade200
                              : const Color(0xff121212))),
                  child: Text(
                    "Get Started",
                    style: Theme.of(context).brightness == Brightness.dark
                        ? TextStyles.body16Light
                        : TextStyles.body16Dark,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: SvgPicture.asset("assets/images/gymrack.svg",
                  width: MediaQuery.sizeOf(context).width * 0.35),
            )
          ],
        ),
      ),
    );
  }
}
