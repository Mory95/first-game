import 'dart:async';
import 'dart:math';

import 'package:first_game/home.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _score = 0;

  late Timer _timer;
  int _start = 10;
  double hauteur = 0;
  double largeur = 0;
  double width = 0.0;
  double height = 0.0;

  Future playDialogBox(Widget widget, Widget action) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        content: widget,
        actions: [
          action,
        ],
      ),
    );
  }

  void cordonner() {
    setState(() {
      largeur = Random().nextDouble() * (width - 20);
      hauteur = Random().nextDouble() * (height - 30);
    });
    // // si largeur + largeur bouton > width => ca depasse
    // // si hauteur + hauteur bouton > height => ca dépasse
    // while (largeur + 30 > width || hauteur + 50 > height) {
    //   print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    //   print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    //   print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    // largeur = Random().nextDouble();
    // hauteur = Random().nextDouble();
    // }
    // // if (height == 0.0 || width == 0.0) {}
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            print('Game over. Vous avez: $_score point');
            // Navigator.pop(context);
          });
          playDialogBox(
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Image.asset('assets/nang ning ning nang.gif'),
                Text('Youppppppppp vous avez $_score'),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _start = 10;
                            _score = 0;
                            Navigator.pop(context);
                            cordonner();
                            startTimer();
                          });
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const GameScreen()));
                        },
                        child: const Text('Reprendre')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                              (Route<dynamic> route) => false);
                        },
                        child: const Text('Quitter')),
                  ],
                )
              ],
            ),
            const SizedBox(),
          );
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final statusBarHeigth = MediaQuery.of(context).padding.top;
      final appBarheight = AppBar().preferredSize.height;

      setState(() {
        width = MediaQuery.of(context).size.width;
        height =
            MediaQuery.of(context).size.height - statusBarHeigth - appBarheight;
      });

      playDialogBox(
        IconButton(
          icon: const Icon(Icons.play_circle_outline_rounded, size: 50),
          onPressed: (() {
            Navigator.pop(context);
            cordonner();
            startTimer();
          }),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (Route<dynamic> route) => false);
          },
          child: const Text('Annuler'),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    // if (_start != 10) {
    //   _timer.cancel();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Row(
            children: [
              InkWell(
                child: const Icon(Icons.play_arrow_rounded),
                onTap: () {
                  startTimer();
                },
              ),
              Text('$_start'),
            ],
          )),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (Route<dynamic> route) => false);
            },
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Center(
                  child: Text(
                "Scores: $_score",
                style: const TextStyle(fontSize: 20),
              )),
            ),
          ],
        ),
        // body: SizedBox(
        //   height: height - appBarheight - statusBarHeigth,
        //   width: width,
        //   child: Stack(
        //     children: [
        //       Positioned(
        //         top: (height - appBarheight - statusBarHeigth) / 2,
        //         left: width / 2,
        //         child: InkWell(
        //           onTap: () => coor(),
        //           child: Container(
        //             // height: 15,
        //             // width: 15,
        //             color: Colors.amber,
        //             child: Text('$haut'),
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // )
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                Positioned(
                    left: largeur,
                    top: hauteur,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(30, 50),
                          backgroundColor: Colors.deepOrange),
                      child: null,
                      onPressed: () {
                        _score += 1;
                        cordonner();
                      },
                    )),
                // Text({hauteur - 50}.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
