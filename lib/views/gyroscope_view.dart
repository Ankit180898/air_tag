import 'package:air_tag/controllers/gyroscope_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class GyroscopeView extends StatelessWidget {
  const GyroscopeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GyroscopeController());
    return Scaffold(
      backgroundColor: const Color(0xFF40AA4A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(()=>
           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    "Finding",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  subtitle: Text(
                    "Ankit's Keys",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Center(
                  child: Transform.rotate(
                    origin: Offset(controller.rotationX, controller.rotationY),
                    angle: controller.rotationZ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset("assets/circle.json",
                            height: MediaQuery.of(context).size.height * 0.15),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          color: Colors.white,
                          Icons.arrow_upward_rounded,
                          size: MediaQuery.of(context).size.height * 0.35,
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: controller.distance.toStringAsFixed(2),
                          style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                        ),
                        TextSpan(
                          text: ' m',
                          style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.normal,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                        ),
                        TextSpan(
                          text: '\nahead',
                          style:GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
