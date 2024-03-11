import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool OTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade700),
                ),
                child: Center(
                  child: Text(
                    displayXO[index],
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (OTurn) {
        displayXO[index] = 'O';
      } else {
        displayXO[index] = 'X';
      }
      OTurn = !OTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _showWinDialog();
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _showWinDialog();
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _showWinDialog();
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _showWinDialog();
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _showWinDialog();
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _showWinDialog();
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _showWinDialog();
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _showWinDialog();
    }
  }

  void _showWinDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Winner'),
          );
        }
    );
  }
}
