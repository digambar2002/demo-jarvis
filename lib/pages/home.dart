import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jarvis/controllers/waveform_controller.dart';
import 'package:siri_wave/siri_wave.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isBlob = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 1, 26),
      body: isBlob
          ? Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Column(
                    children: [
                      Text(
                        "Hi, Digambar 👋",
                        style: GoogleFonts.shareTech(
                          textStyle: const TextStyle(
                              color: Colors.cyan,
                              letterSpacing: .5,
                              fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "How Can I Help You",
                        style: GoogleFonts.rajdhani(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ClipRect(
                        child: GestureDetector(
                          onTap: () => {
                            setState(() {
                              isBlob = false;
                            })
                          },
                          child: Image.asset(
                            "assets/gif/jarvis.gif", // Path to your GIF asset
                            width: 300, // Adjust size as needed
                            height: 300, // Adjust size as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextAnimatorSequence(
                        loop: true,
                        children: [
                          TextAnimator(
                            "J . A . R . V . I . S ",
                            style: GoogleFonts.comfortaa(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            atRestEffect: WidgetRestingEffects.pulse(),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          : Container(
              child: Text(""),
            ),
      bottomNavigationBar: !isBlob
          ? Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: BottomAppBar(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: SiriWaveform.ios9(
                    controller: WaveformController.controller,
                    options:
                        const IOS9SiriWaveformOptions(height: 300, width: 400),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
