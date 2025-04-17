import 'dart:async';

import 'package:animals_v3/name.dart';
import 'package:animals_v3/panner_ad.dart';
import 'package:animals_v3/random_g1.dart';
import 'package:animals_v3/random_g2.dart';
import 'package:animals_v3/random_g3.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_launcher_icons/utils.dart';
import 'package:wakelock/wakelock.dart';

int ho = 0;
int h = 1;
int n = 28;
bool swit = false;
int xt = 0;
int x = 0;
late int t;
late int g;
int gamei = 0;
int s1 = 0;
int s2 = 0;
int s1_l = 0;
int s2_l = 0;
List listindex = [];
int i = 0;
int score = 0;
var animal_sound = do_4_gam2.last;
var animal_sound2 = do_4_gam3.last;
double op = 0;

AssetsAudioPlayer player1 = new AssetsAudioPlayer();
AssetsAudioPlayer player2 = new AssetsAudioPlayer();

List do_4_gam = new do_4_gam_c().do_4_gam_cc(game_v);
List do_4_gam2 = new do_4_gam_c2().do_4_gam_b1(game_v2);
List do_4_gam3 = new do_4_gam_c3().do_4_gam_b1(game_v3);

colorf(index) {
  late var lo;
  if (listindex.any((element) => element == index)) {
    lo = (ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.color));
  } else {
    lo = (ColorFilter.mode(Colors.black.withOpacity(0), BlendMode.color));
  }

  return lo;
}

colorf2(num) {
  late var lo;
  if (h != num) {
    lo = (ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.color));
  } else {
    lo = (ColorFilter.mode(Colors.black.withOpacity(0), BlendMode.color));
  }

  return lo;
}

colorf3() {
  late var lo;
  if (h == 1 || h == 11) {
    lo = (ColorFilter.mode(Colors.black.withOpacity(0), BlendMode.color));
  } else {
    lo = (ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.color));
  }

  return lo;
}

imageopacity(index) {
  late double lo;
  if (listindex.any((element) => element == index)) {
    lo = .15;
  } else {
    lo = 1;
  }

  return lo;
}

colorshadow(index) {
  late var lo;
  if (listindex.any((element) => element == index)) {
    lo = BoxShadow(spreadRadius: 0, offset: Offset(0, 0), blurRadius: 0, color: Color.fromARGB(255, 255, 255, 255).withOpacity(.8));
  } else {
    lo = BoxShadow(spreadRadius: 1, offset: Offset(-2, 2), blurRadius: 2, color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8));
  }

  return lo;
}

late int t2;
int k = 1;
int k2 = 1;
int k3 = 1;
bool on = true;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    Wakelock.enable();
    Timer.run(() {
      handleTimeout2() {
        if (toopen == false) {
          Navigator.of(context).pushNamedAndRemoveUntil("temp", (route) => false);
        }
      }

      Timer scheduleTimeouut([int milliseconds = 10000]) => Timer(Duration(milliseconds: milliseconds), handleTimeout2);
      scheduleTimeouut();
    });

    super.initState();
  }

  hom() {
    if (h == 1) {
      return ListView(
        physics: BouncingScrollPhysics(),
        children: [
          GridView.builder(
              shrinkWrap: true,
              itemCount: n,
              padding: EdgeInsets.all(10),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: AssetImage("images/${index + 1}.png"), fit: BoxFit.cover),
                      boxShadow: [BoxShadow(spreadRadius: 1, offset: Offset(-2, 2), blurRadius: 2, color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8))]),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      t = index + 1;
                      h = 11;
                      setState(() {});
                    },
                  ),
                );
              }),
          Container(
            height: 60,
          )
        ],
      );
    }
    if (h == 11) {
      xt = ++x;
      player2.open(
          Playlist(audios: [
            Audio("audio1/$t.mp3"),
          ]),
          playInBackground: PlayInBackground.disabledPause);

      player1.open(
          Playlist(audios: [
            Audio("audio2/s2.mp3"),
            Audio("audio2/s1.mp3"),
            Audio("audio2/$t.mp3"),
            Audio("audio2/s2.mp3"),
            Audio("audio2/s1.mp3"),
            Audio("audio2/$t.mp3"),
            Audio("audio2/s2.mp3"),
            Audio("audio2/s1.mp3"),
            Audio("audio2/$t.mp3"),
            Audio("audio2/s2.mp3"),
            Audio("audio2/s1.mp3"),
          ]),
          playInBackground: PlayInBackground.disabledPause);
      if (swit == false) {
        player1.playlistFinished.listen((finshed) {
          if (finshed) {
            setState(() {
              player1.stop();
              player2.stop();
              player1 = new AssetsAudioPlayer();
              if (swit == false) {
                h = 1;
              }
            });
          }
        });
      }
      if (swit) {
        Timer.run(() {
          int x2t = xt;
          go() async {
            await player1.stop();
            await player2.stop();

            if (t < n && x2t == xt) {
              t = ++t;
              setState(() {});
            } else if (t == n && x2t == xt) {
              t = 1;
              setState(() {});
            }
          }

          Timer togo([int milliseconds = 10500]) => Timer(Duration(milliseconds: milliseconds), go);

          togo();
        });
      }
      return Stack(
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(bottom: 100),
            color: Colors.amberAccent.withOpacity(.2),
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), image: DecorationImage(image: AssetImage("gifs/${t}.gif"), fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () async {
                      if (t > 1) {
                        await player1.stop();
                        await player2.stop();
                        t = --t;
                        h = 11;
                        setState(() {});
                      } else if (t == 1) {
                        await player1.stop();
                        await player2.stop();
                        t = n;
                        h = 11;
                        setState(() {});
                      }
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                Text(
                  name[t],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromARGB(255, 4, 56, 6), fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () async {
                      if (t < n) {
                        await player1.stop();
                        await player2.stop();
                        t = ++t;
                        h = 11;
                        setState(() {});
                      } else if (t == n) {
                        await player1.stop();
                        await player2.stop();
                        t = 1;
                        h = 11;
                        setState(() {});
                      }
                    },
                    icon: Icon(Icons.arrow_forward_ios)),
              ],
            ),
          ),
        ],
      );
    }
    if (h == 2) {
      return Container(
          child: GridView.builder(
              itemCount: 12,
              padding: EdgeInsets.all(10),
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                g = do_4_gam[index];
                return Card(
                  child: InkWell(
                    onTap: () {
                      if (gamei == 0) {
                        s1 = do_4_gam[index];
                        s1_l = index;
                        gamei = 1;
                      } else {
                        s2 = do_4_gam[index];
                        s2_l = index;
                        gamei = 0;
                      }
                      if (listindex.any((element) => element == s1_l)) {
                      } else {
                        if (s1 == s2 && s1_l != s2_l) {
                          player1.stop();
                          listindex.add(s1_l);
                          listindex.add(s2_l);

                          score++;
                          player1.open(
                            Playlist(audios: [
                              Audio("audio1/${do_4_gam[index]}.mp3"),
                            ]),
                          );

                          setState(() {});
                        }
                      }

                      if (score >= 6) {
                        i = 1;

                        Timer.run(() {
                          togame1() {
                            if (i == 1) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Image.asset(
                                    "gifs/cell.gif",
                                    fit: BoxFit.cover,
                                  );
                                },
                              );
                              player1.open(
                                Playlist(audios: [
                                  Audio("audio2/c1.mp3"),
                                ]),
                              );
                              player2.open(
                                Playlist(audios: [
                                  Audio("audio2/c2.mp3"),
                                ]),
                              );
                              ho = 1;
                            }
                          }

                          Timer too1([int milliseconds = 3000]) => Timer(Duration(milliseconds: milliseconds), togame1);

                          too1();
                        });

                        Timer.run(() {
                          togame() async {
                            if (i == 1) {
                              await player1.stop();
                              await player2.stop();
                              score = 0;
                              gamei = 0;
                              s1 = 0;
                              s2 = 0;
                              s1_l = 0;
                              s2_l = 0;
                              game_v++;
                              listindex = [];
                              i = 0;
                              do_4_gam = new do_4_gam_c().do_4_gam_cc(game_v);
                              Navigator.pop(context);
                              setState(() {});
                              ho = 0;
                            }
                          }

                          Timer too([int milliseconds = 9000]) => Timer(Duration(milliseconds: milliseconds), togame);

                          too();
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage("images/$g.png"), opacity: imageopacity(index), fit: BoxFit.cover),
                          boxShadow: [colorshadow(index)]),
                    ),
                  ),
                );
              }));
    }
    if (h == 3) {
      if (i == 0) {
        player1.open(
            Playlist(audios: [
              Audio("audio1/$animal_sound.mp3"),
              Audio("audio2/s2.mp3"),
            ]),
            loopMode: LoopMode.playlist);
      }
      return Container(
        padding: EdgeInsetsDirectional.only(bottom: 50),
        child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("gifs/${do_4_gam2.last}.gif"), opacity: op, fit: BoxFit.cover),
                    color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 350,
                ),
                Container(
                  height: 130,
                  child: GridView.builder(
                      itemCount: 3,
                      padding: EdgeInsets.all(10),
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            if (i == 0) {
                              if (do_4_gam2[index] == do_4_gam2.last) {
                                await player1.stop();
                                player1.open(
                                  Playlist(audios: [
                                    Audio("audio2/c2.mp3"),
                                  ]),
                                );
                                i = 1;
                                op = 1;
                                setState(() {});
                                game_v2++;
                                Timer.run(() {
                                  togame() async {
                                    if (i == 1) {
                                      await player1.stop();
                                      await player2.stop();
                                      listindex = [];
                                      i = 0;
                                      op = 0;
                                      do_4_gam2 = new do_4_gam_c2().do_4_gam_b1(game_v2);
                                      animal_sound = do_4_gam2.last;
                                      setState(() {});
                                    }
                                  }

                                  Timer too([int milliseconds = 5000]) => Timer(Duration(milliseconds: milliseconds), togame);

                                  too();
                                });
                              } else {
                                listindex.add(index);
                                setState(() {});
                              }
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage("images/${do_4_gam2[index]}.png"),
                                    opacity: imageopacity(index),
                                    colorFilter: colorf(index),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(spreadRadius: 1, offset: Offset(-2, 2), blurRadius: 2, color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8))
                                ]),
                          ),
                        );
                      }),
                ),
              ],
            )),
      );
    }
    if (h == 4) {
      if (i == 0) {
        player1.open(
            Playlist(audios: [
              Audio("audio2/$animal_sound2.mp3"),
              Audio("audio2/s2.mp3"),
            ]),
            loopMode: LoopMode.playlist);
      }

      return Container(
        padding: EdgeInsetsDirectional.only(bottom: 50),
        child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("gifs/${do_4_gam3.last}.gif"), opacity: op, fit: BoxFit.cover),
                    color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 350,
                ),
                Container(
                  height: 130,
                  child: GridView.builder(
                      itemCount: 3,
                      padding: EdgeInsets.all(10),
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            if (i == 0) {
                              if (do_4_gam3[index] == do_4_gam3.last) {
                                op = 1;

                                i = 1;

                                await player1.setLoopMode(LoopMode.none);
                                await player1.stop();
                                await player1.open(
                                  Playlist(audios: [
                                    Audio("audio2/c2.mp3"),
                                  ]),
                                );
                                player2.open(
                                  Playlist(audios: [
                                    Audio("audio1/${do_4_gam3.last}.mp3"),
                                  ]),
                                );
                                setState(() {});
                                game_v3++;

                                Timer.run(() {
                                  togame() async {
                                    if (i == 1) {
                                      await player1.stop();
                                      await player2.stop();
                                      listindex = [];
                                      i = 0;
                                      op = 0;

                                      do_4_gam3 = new do_4_gam_c3().do_4_gam_b1(game_v3);
                                      animal_sound2 = do_4_gam3.last;
                                      setState(() {});
                                    }
                                  }

                                  Timer too([int milliseconds = 6000]) => Timer(Duration(milliseconds: milliseconds), togame);

                                  too();
                                });
                              } else {
                                listindex.add(index);
                                setState(() {});
                              }
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage("images/${do_4_gam3[index]}.png"),
                                    opacity: imageopacity(index),
                                    colorFilter: colorf(index),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(spreadRadius: 1, offset: Offset(-2, 2), blurRadius: 2, color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8))
                                ]),
                          ),
                        );
                      }),
                ),
              ],
            )),
      );
    }
  }

  void toast1(
    BuildContext context,
  ) {}

  Future<bool> _exet1(BuildContext context) async {
    if (ho != 1) {
      if (h == 1) {
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: Color.fromARGB(255, 241, 225, 169).withOpacity(.85),
                content: Text(
                  "إضغط هنا للخروج",
                  textAlign: TextAlign.center,
                ),
                contentTextStyle: TextStyle(color: Color.fromARGB(255, 4, 56, 6), fontSize: 17),
                actions: [
                  Container(
                    alignment: Alignment.center,
                    child: IconButton(
                        iconSize: 37,
                        onPressed: () async {
                          SystemNavigator.pop();
                        },
                        icon: Icon(Icons.logout)),
                  )
                ],
              );
            }));

        return true;
      }
      if (h == 11) {
        await player1.open(
          Playlist(audios: [
            Audio("audio2/s1.mp3"),
          ]),
        );
        await player2.open(
          Playlist(audios: [
            Audio("audio2/s1.mp3"),
          ]),
        );
        h = 1;
        i = 0;
        await player1.stop();
        await player2.stop();
        setState(() {});
        return false;
      }
      if (h == 2) {
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: Color.fromARGB(255, 241, 225, 169).withOpacity(.85),
                content: Text(
                  "إضغط هنا للخروج من اللعبة",
                  textAlign: TextAlign.center,
                ),
                contentTextStyle: TextStyle(color: Color.fromARGB(255, 4, 56, 6), fontSize: 17),
                actions: [
                  Container(
                    alignment: Alignment.center,
                    child: IconButton(
                        iconSize: 37,
                        onPressed: () async {
                          player1.open(
                            await Playlist(audios: [
                              Audio("audio2/s1.mp3"),
                            ]),
                          );
                          await player2.open(
                            Playlist(audios: [
                              Audio("audio2/s1.mp3"),
                            ]),
                          );
                          await player1.stop();
                          await player2.stop();
                          score = 0;
                          gamei = 0;
                          s1 = 0;
                          s2 = 0;
                          s1_l = 0;
                          s2_l = 0;
                          game_v++;
                          listindex = [];
                          i = 0;
                          do_4_gam = new do_4_gam_c().do_4_gam_cc(game_v);
                          h = 1;
                          setState(() {});
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.toys)),
                  )
                ],
              );
            }));
        return false;
      }
      if (h == 3) {
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: Color.fromARGB(255, 241, 225, 169).withOpacity(.85),
                content: Text(
                  "إضغط هنا للخروج من اللعبة",
                  textAlign: TextAlign.center,
                ),
                contentTextStyle: TextStyle(color: Color.fromARGB(255, 4, 56, 6), fontSize: 17),
                actions: [
                  Container(
                    alignment: Alignment.center,
                    child: IconButton(
                        iconSize: 37,
                        onPressed: () async {
                          player1.open(
                            await Playlist(audios: [
                              Audio("audio2/s1.mp3"),
                            ]),
                          );
                          await player2.open(
                            Playlist(audios: [
                              Audio("audio2/s1.mp3"),
                            ]),
                          );
                          await player1.stop();
                          await player2.stop();
                          listindex = [];
                          i = 0;
                          op = 0;
                          do_4_gam2 = new do_4_gam_c2().do_4_gam_b1(game_v2);
                          animal_sound = do_4_gam2.last;
                          h = 1;
                          setState(() {});
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.toys)),
                  )
                ],
              );
            }));
        return false;
      }
      if (h == 4) {
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: Color.fromARGB(255, 241, 225, 169).withOpacity(.85),
                content: Text(
                  "إضغط هنا للخروج من اللعبة",
                  textAlign: TextAlign.center,
                ),
                contentTextStyle: TextStyle(color: Color.fromARGB(255, 4, 56, 6), fontSize: 17),
                actions: [
                  Container(
                    alignment: Alignment.center,
                    child: IconButton(
                        iconSize: 37,
                        onPressed: () async {
                          player1.open(
                            await Playlist(audios: [
                              Audio("audio2/s1.mp3"),
                            ]),
                          );
                          await player2.open(
                            Playlist(audios: [
                              Audio("audio2/s1.mp3"),
                            ]),
                          );
                          await player1.stop();
                          await player2.stop();
                          listindex = [];
                          i = 0;
                          op = 0;
                          do_4_gam3 = new do_4_gam_c3().do_4_gam_b1(game_v3);
                          animal_sound2 = do_4_gam3.last;
                          h = 1;
                          setState(() {});
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.toys)),
                  )
                ],
              );
            }));
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exet1(context),
      child: Scaffold(
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    Container(padding: EdgeInsetsDirectional.only(bottom: 60), child: hom()),
                    Positioned(
                        left: 10,
                        bottom: 65,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.amberAccent.withOpacity(.6), borderRadius: BorderRadius.all(Radius.circular(50))),
                          width: MediaQuery.of(context).size.width - 20,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (h == 2 || h == 3 || h == 4) {
                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            backgroundColor: Color.fromARGB(255, 241, 225, 169).withOpacity(.85),
                                            content: Text(
                                              "إضغط هنا للخروج من اللعبة",
                                              textAlign: TextAlign.center,
                                            ),
                                            contentTextStyle: TextStyle(color: Color.fromARGB(255, 4, 56, 6), fontSize: 17),
                                            actions: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                    iconSize: 37,
                                                    onPressed: () async {
                                                      await player1.open(
                                                        Playlist(audios: [
                                                          Audio("audio2/s1.mp3"),
                                                        ]),
                                                      );
                                                      await player2.open(
                                                        Playlist(audios: [
                                                          Audio("audio2/s1.mp3"),
                                                        ]),
                                                      );
                                                      if (h == 2) {
                                                        await player1.stop();
                                                        await player2.stop();
                                                        score = 0;
                                                        gamei = 0;
                                                        s1 = 0;
                                                        s2 = 0;
                                                        s1_l = 0;
                                                        s2_l = 0;
                                                        game_v++;
                                                        listindex = [];
                                                        i = 0;
                                                        do_4_gam = new do_4_gam_c().do_4_gam_cc(game_v);
                                                        h = 1;
                                                        setState(() {});
                                                      }
                                                      if (h == 3) {
                                                        await player1.stop();
                                                        await player2.stop();
                                                        listindex = [];
                                                        i = 0;
                                                        op = 0;
                                                        do_4_gam2 = new do_4_gam_c2().do_4_gam_b1(game_v2);
                                                        animal_sound = do_4_gam2.last;
                                                        h = 1;
                                                        setState(() {});
                                                      }
                                                      if (h == 4) {
                                                        await player1.stop();
                                                        await player2.stop();
                                                        listindex = [];
                                                        i = 0;
                                                        op = 0;
                                                        do_4_gam3 = new do_4_gam_c3().do_4_gam_b1(game_v3);
                                                        animal_sound2 = do_4_gam3.last;
                                                        h = 1;
                                                        setState(() {});
                                                      }
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icon(Icons.toys)),
                                              )
                                            ],
                                          );
                                        }));
                                  } else if (h == 11) {
                                    player1.open(
                                      Playlist(audios: [
                                        Audio("audio2/s1.mp3"),
                                      ]),
                                    );
                                    player2.open(
                                      Playlist(audios: [
                                        Audio("audio2/s1.mp3"),
                                      ]),
                                    );
                                    swit = false;
                                    h = 1;
                                    i = 0;
                                    await player1.stop();
                                    await player2.stop();
                                    setState(() {});
                                  }
                                },
                                enableFeedback: true,
                                child: Container(
                                  width: 42, height: 42,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/g2.png"), colorFilter: colorf3()),
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    boxShadow: [
                                      BoxShadow(spreadRadius: .5, offset: Offset(-1, 1), blurRadius: 2, color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8))
                                    ],
                                  ),
                                  // child: Image(image: AssetImage("images/g2.png")),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (h == 3 || h == 4) {
                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            backgroundColor: Color.fromARGB(255, 241, 225, 169).withOpacity(.85),
                                            content: Text(
                                              "إضغط هنا للخروج من اللعبة",
                                              textAlign: TextAlign.center,
                                            ),
                                            contentTextStyle: TextStyle(color: Color.fromARGB(255, 4, 56, 6), fontSize: 17),
                                            actions: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                    iconSize: 37,
                                                    onPressed: () async {
                                                      await player1.open(
                                                        Playlist(audios: [
                                                          Audio("audio2/s1.mp3"),
                                                        ]),
                                                      );
                                                      await player2.open(
                                                        Playlist(audios: [
                                                          Audio("audio2/s1.mp3"),
                                                        ]),
                                                      );
                                                      if (h == 3) {
                                                        await player1.stop();
                                                        await player2.stop();
                                                        listindex = [];
                                                        i = 0;
                                                        op = 0;
                                                        do_4_gam2 = new do_4_gam_c2().do_4_gam_b1(game_v2);
                                                        animal_sound = do_4_gam2.last;
                                                        h = 2;
                                                        setState(() {});
                                                      }
                                                      if (h == 4) {
                                                        await player1.stop();
                                                        await player2.stop();
                                                        listindex = [];
                                                        i = 0;
                                                        op = 0;
                                                        do_4_gam3 = new do_4_gam_c3().do_4_gam_b1(game_v3);
                                                        animal_sound2 = do_4_gam3.last;
                                                        h = 2;
                                                        setState(() {});
                                                      }
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icon(Icons.toys)),
                                              )
                                            ],
                                          );
                                        }));
                                  }
                                  if (h == 11) {
                                    player1.open(
                                      Playlist(audios: [
                                        Audio("audio2/s1.mp3"),
                                      ]),
                                    );
                                    player2.open(
                                      Playlist(audios: [
                                        Audio("audio2/s1.mp3"),
                                      ]),
                                    );
                                    swit = false;
                                    i = 0;
                                    await player1.stop();
                                    await player2.stop();
                                    h = 2;
                                    setState(() {});
                                  }
                                  if (h == 1) {
                                    h = 2;
                                    setState(() {});
                                  }
                                },
                                enableFeedback: true,
                                child: Container(
                                  width: 42, height: 42,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/g3.png"), colorFilter: colorf2(2)),
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    boxShadow: [
                                      BoxShadow(spreadRadius: .5, offset: Offset(-1, 1), blurRadius: 2, color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8))
                                    ],
                                  ),
                                  // child: Image(image: AssetImage("images/g2.png")),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (h == 2 || h == 4) {
                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            backgroundColor: Color.fromARGB(255, 241, 225, 169).withOpacity(.85),
                                            content: Text(
                                              "إضغط هنا للخروج من اللعبة",
                                              textAlign: TextAlign.center,
                                            ),
                                            contentTextStyle: TextStyle(color: Color.fromARGB(255, 4, 56, 6), fontSize: 17),
                                            actions: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                    iconSize: 37,
                                                    onPressed: () async {
                                                      await player1.open(
                                                        Playlist(audios: [
                                                          Audio("audio2/s1.mp3"),
                                                        ]),
                                                      );
                                                      await player2.open(
                                                        Playlist(audios: [
                                                          Audio("audio2/s1.mp3"),
                                                        ]),
                                                      );
                                                      if (h == 2) {
                                                        await player1.stop();
                                                        await player2.stop();
                                                        score = 0;
                                                        gamei = 0;
                                                        s1 = 0;
                                                        s2 = 0;
                                                        s1_l = 0;
                                                        s2_l = 0;
                                                        game_v++;
                                                        listindex = [];
                                                        i = 0;
                                                        do_4_gam = new do_4_gam_c().do_4_gam_cc(game_v);
                                                        h = 3;
                                                        setState(() {});
                                                      }
                                                      if (h == 4) {
                                                        await player1.stop();
                                                        await player2.stop();
                                                        listindex = [];
                                                        i = 0;
                                                        op = 0;
                                                        do_4_gam3 = new do_4_gam_c3().do_4_gam_b1(game_v3);
                                                        animal_sound2 = do_4_gam3.last;
                                                        h = 3;
                                                        setState(() {});
                                                      }
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icon(Icons.toys)),
                                              )
                                            ],
                                          );
                                        }));
                                  }
                                  if (h == 11) {
                                    player1.open(
                                      Playlist(audios: [
                                        Audio("audio2/s1.mp3"),
                                      ]),
                                    );
                                    player2.open(
                                      Playlist(audios: [
                                        Audio("audio2/s1.mp3"),
                                      ]),
                                    );
                                    swit = false;
                                    i = 0;
                                    await player1.stop();
                                    await player2.stop();
                                    h = 3;
                                    setState(() {});
                                  }
                                  if (h == 1) {
                                    h = 3;
                                    setState(() {});
                                  }
                                },
                                enableFeedback: true,
                                child: Container(
                                  width: 42, height: 42,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/g3.png"), colorFilter: colorf2(3)),
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    boxShadow: [
                                      BoxShadow(spreadRadius: .5, offset: Offset(-1, 1), blurRadius: 2, color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8))
                                    ],
                                  ),
                                  // child: Image(image: AssetImage("images/g2.png")),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (h == 2 || h == 3) {
                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            backgroundColor: Color.fromARGB(255, 241, 225, 169).withOpacity(.85),
                                            content: Text(
                                              "إضغط هنا للخروج من اللعبة",
                                              textAlign: TextAlign.center,
                                            ),
                                            contentTextStyle: TextStyle(color: Color.fromARGB(255, 4, 56, 6), fontSize: 17),
                                            actions: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                    iconSize: 37,
                                                    onPressed: () async {
                                                      await player1.open(
                                                        Playlist(audios: [
                                                          Audio("audio2/s1.mp3"),
                                                        ]),
                                                      );
                                                      await player2.open(
                                                        Playlist(audios: [
                                                          Audio("audio2/s1.mp3"),
                                                        ]),
                                                      );
                                                      if (h == 2) {
                                                        await player1.stop();
                                                        await player2.stop();
                                                        score = 0;
                                                        gamei = 0;
                                                        s1 = 0;
                                                        s2 = 0;
                                                        s1_l = 0;
                                                        s2_l = 0;
                                                        game_v++;
                                                        listindex = [];
                                                        i = 0;
                                                        do_4_gam = new do_4_gam_c().do_4_gam_cc(game_v);
                                                        h = 4;
                                                        setState(() {});
                                                      }
                                                      if (h == 3) {
                                                        await player1.stop();
                                                        await player2.stop();
                                                        listindex = [];
                                                        i = 0;
                                                        op = 0;
                                                        do_4_gam2 = new do_4_gam_c2().do_4_gam_b1(game_v2);
                                                        animal_sound = do_4_gam2.last;
                                                        h = 4;
                                                        setState(() {});
                                                      }
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icon(Icons.toys)),
                                              )
                                            ],
                                          );
                                        }));
                                  }
                                  if (h == 11) {
                                    player1.open(
                                      Playlist(audios: [
                                        Audio("audio2/s1.mp3"),
                                      ]),
                                    );
                                    player2.open(
                                      Playlist(audios: [
                                        Audio("audio2/s1.mp3"),
                                      ]),
                                    );
                                    swit = false;
                                    i = 0;
                                    await player1.stop();
                                    await player2.stop();
                                    h = 4;
                                    setState(() {});
                                  }
                                  if (h == 1) {
                                    h = 4;
                                    setState(() {});
                                  }
                                },
                                enableFeedback: true,
                                child: Container(
                                  width: 42, height: 42,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("images/g3.png"), colorFilter: colorf2(4)),
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    boxShadow: [
                                      BoxShadow(spreadRadius: .5, offset: Offset(-1, 1), blurRadius: 2, color: Color.fromARGB(255, 30, 73, 31).withOpacity(.8))
                                    ],
                                  ),
                                  // child: Image(image: AssetImage("images/g2.png")),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                      bottom: 0,
                      child: Stack(children: [
                        Container(
                          color: Colors.amberAccent,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned(
                          // child: Container(
                          //   color: Colors.red,
                          //   width: 500,
                          //   height: 20,
                          // ),
                          bottom: 0,
                          // left: (((MediaQuery.of(context).size.width) - scc) / 2),
                          child: Container(
                            // alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: const Adpanner(),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      // IconButton(
                                      //     onPressed: () {},
                                      //     icon: Icon(
                                      //       Icons.upcoming,
                                      //       size: 35,
                                      //     )),
                                      IconButton(
                                          onPressed: () {
                                            showBottomSheet(context) {
                                              return showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      color: Colors.amberAccent,
                                                      height: 150,
                                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                                        Switch(
                                                            activeColor: const Color.fromARGB(255, 4, 56, 6),
                                                            value: swit,
                                                            onChanged: (val) {
                                                              // if (value == true) {
                                                              //   swit = true;
                                                              // } else {
                                                              //   swit = false;
                                                              // }
                                                              // setState(() {});
                                                              swit = val;
                                                              // setState(() {});
                                                              Navigator.pop(context);
                                                            }),
                                                        Text(
                                                          "تشغيل تلقائي متتابع",
                                                          style: TextStyle(color: Color.fromARGB(255, 4, 56, 6)),
                                                        ),
                                                      ]),
                                                    );
                                                  });
                                            }

                                            // setState(() {
                                            showBottomSheet(context);
                                            // });
                                          },
                                          icon: Icon(
                                            Icons.settings,
                                            size: 35,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ))),
    );
  }
}
