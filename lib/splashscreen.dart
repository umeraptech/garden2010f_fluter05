import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:garden2010f_fluter05/todolist.dart';

import 'package:garden2010f_fluter05/circularprogressindecator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late int counter = 0;
  Random rnd = Random();
  late String saying = "";
  List<String> sayings = [
    "#Markhor🦌",
    "#MeTheLoneWolf🐺",
    "#thuglife☠️👽⚔️🔪⛓",
    "#nothingbox🙇🤷🏽‍♂️🕸🎁",
    "#hakunamatata🐅",
    "#maulahjat🏋🏾‍⚔",
    "#deadman💀⚰️",
    "#deadwillriseagain⚔",
    "#istandalone👑",
    "#istandaloneforjustic🐅☘️",
    "#nøfate⚓️🚀⚰️",
    "#bornfreeandwild👅💪",
    "#bornfreeandlivefree🐅🐆🐈",
    "#brutaltactician🎖",
    "#holysinner🕊",
    "#devilhunter😇",
    "#khalaimakhlooq👻☠️😈🦅👽",
    "#aakhrichittan👻🚶🏽‍♂️🦁🐆🐅🌊🧗🏼‍♂️🥇🎖🏆🗻",
    "#KoiJalGiaKisiNayDuaDi👤🔥🎃☠️🤯😇🙏📦",
    "#ZakhmiDillJallaDon🤦🏻‍♂️🤕🔥💔👿☠️👻",
    "#WhatHappensToTheSoulsWhoLookInTheEyesOfDragon🦖🐉☃️🌊⛈💥🔥🌪🐲☠️👻"
  ];

  void loadingStatus(){
    Future.delayed(const Duration(seconds: 1)).then((_){
      setState(() {
        counter+=25;
        saying = sayings[rnd.nextInt(18)];
      });
      loadingStatus();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingStatus();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const TodoList(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/nova.jpg"),
            fit: BoxFit.cover
          ),

        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicatorWidget(),
              const SizedBox(height: 20,),
              Text("Loading: $counter%",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),),
              const SizedBox(height: 20.0,),
              Text(saying,style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),),
              const SizedBox(height: 20.0,),
              Text('App powered by DeadMan Inc.',style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
