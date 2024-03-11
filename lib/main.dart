import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with TickerProviderStateMixin {

  static var myNewFont = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.black, letterSpacing: 3),
  );
  static var myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.white, letterSpacing: 3),
  );

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: Container(
                        child: Text(
                          "TIC TAC TOE",
                          style: myNewFontWhite.copyWith(fontSize: 25),
                        ),
                      )
                  )
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: AvatarGlow(
                    //endRadius: 140,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white,
                    repeat: true,
                    //repeatPauseDuration : Duration(seconds: 1),
                    startDelay: Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.none
                        ),
                        shape: BoxShape.circle
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade900,
                        radius: 80.0,
                        child: Container(
                          child: Image.asset(
                            'D:/projects/AndroidStudioProjects/tictactoe_flutter/lib/images/Tic_tac_toe.png',
                            color: Colors.white,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      )
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Container(
                        child: Text(
                          "@ArnabC27",
                          style: myNewFontWhite.copyWith(fontSize: 20),
                        ),
                      )
                  )
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          "PLAY GAME",
                          style: myNewFont,
                        )
                      )
                    ),
                  ),
                ),
              )
            ],
          )
        )
      )
    );
  }
}



