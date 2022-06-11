import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '가위바위보 게임',
      home: Game(),
    );
  }
}


class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  PlayGame playGame = PlayGame();

  void _showWinner(bool isWinner){
    showDialog(
        context: context,
        builder: (_) => Center(
          child: Container(
            width:double.infinity,
            height: 190,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color:Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( isWinner ? "가뿐히 이겼습니다" : "뭐 패배는 인정합니다", style:(
                    TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold)
                )),
                SizedBox(height: 16,),
                SizedBox(
                    height: 46,
                    child: Text( isWinner ? '너무 쉬워서 하품이 나왔습니다' : '하지만 전 아직 최선을 다하지 않았습니다', style:(
                        TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 16)
                    ))
                )
                ,
                SizedBox(height: 16,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffFBD165),
                        elevation: 0,
                        minimumSize: Size(double.infinity, 56) // put the width and height you want
                    ),
                    onPressed:(){
                      setState(() {

                      });
                      Navigator.pop(context);
                    },
                    child: Text('확인',style: TextStyle(color:Colors.black),))
              ],
            ),
          ),
        )
    );
  }



  @override
  Widget build(BuildContext context) {

      Future.delayed(Duration.zero,(){
        if(playGame.counter==5){
          _showWinner(true);
          playGame.counter=0;
        }
    });

    // print(playGame.counter);
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text('가위바위보 게임'),
        backgroundColor: Colors.red[200],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text('다음 중 하나를 선택하세요',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(onPressed: () {
                    setState(() {
                      playGame.clickRandom();
                      playGame.score();
                      playGame.meClick(0);
                      // if(computer == 0) print("rock");
                      // me = "rock";
                    });
                  }, child: Image.asset('assets/rock.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(onPressed: () {
                    setState(() {
                      playGame.clickRandom();
                      playGame.score();
                      playGame.meClick(1);
                      // if(computer == 1) print("scissor");
                      // me = "scissor";
                    });
                  }, child: Image.asset('assets/scissors.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(onPressed: () {
                    setState(() {
                      playGame.clickRandom();
                      playGame.score();
                      playGame.meClick(2);
                      // if(computer == 0) print("paper");
                      // me = "paper";
                    });
                  }, child: Image.asset('assets/paper.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60.0,
            ),
            Text('컴퓨터: ${playGame.computer.toString()}',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('나: ${playGame.me.toString()}',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('점수: ${playGame.counter.toString()}',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 15.0,
              ),
            ),
            
            SizedBox(
              height: 100.0,
            ),
            Center(
              child: TextButton(onPressed: () {
                setState(() {
                  playGame.counter = 0;
                });
              },
                child: Text('초기화',
                  style: TextStyle(
                      color: Colors.red[300],
                      letterSpacing: 2.0,
                      fontSize: 20.0
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayGame{
  
  var computer=0;
  int me = 0;
  int counter = 0;

  void meClick(int my){
    me = my;
  }

  void clickRandom(){
    computer = Random().nextInt(3);
  }
  void score(){
    if(computer == 0) { // 컴퓨터가 바위를 낸 경우
      if(me == 0) {print("비겼습니다");}
      else if (me == 1) {print("컴퓨터가 이겼습니다");}
      else if (me == 2) {
        counter++;
        print("플레이어가 이겼습니다");}
      print(counter);
    }
    else if(computer == 1) {
     
      if(me == 0) {
        counter++;
        print("플레이어가 이겼습니다");}
      else if(me == 1) {print("비겼습니다");}
      else if (me == 2) {print("컴퓨터가 이겼습니다");}
      print(counter);
    }
    else if(computer == 2) { // 컴퓨터가 보를 낸 경우
      if(me == 0) {print("컴퓨터가 이겼습니다");}
      else if(me == 1) {
        counter++;
        print("플레이어가 이겼습니다");}
      else if (me == 2) {print("비겼습니다");}
      print(counter);
    }
  }
}

