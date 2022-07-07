import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PlayGame.dart';

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

  void _showWinner(bool isWinner){ // 승자를 판별하는 함수
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
                Text( isWinner ? "플레이어가 이겼습니다" : "컴퓨터가 이겼습니다", style:( // isWinner가 true면 플레이어 승, isWinner가 false면 컴퓨터 승
                    TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold)
                )),
                SizedBox(height: 16,),
                SizedBox(
                    height: 46,
                    child: Text( isWinner ? '축하합니다!' : '다시 도전하세요!', style:(
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
                      setState(() { // 확인 버튼을 누르면 모든 점수가 초기화
                        playGame.me = 0;
                        playGame.computer = 0;
                        playGame.counter = 0;
                        playGame.myCounter = 0;
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
        if(playGame.counter==5){ // 게임 횟수가 5회가 되면 게임 종료 후 승자 판별
          _showWinner(true);
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
            Row( // 바위, 가위, 보 순으로 버튼 나열 (바위=0, 가위=1, 보=2)
              children: <Widget>[
                Expanded(
                  child: TextButton(onPressed: () { // 바위 버튼
                    setState(() {
                      playGame.clickRandom();
                      playGame.score();
                      playGame.meClick(0);
                    });
                  }, child: Image.asset('assets/rock.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(onPressed: () { // 가위 버튼
                    setState(() {
                      playGame.clickRandom();
                      playGame.score();
                      playGame.meClick(1);
                    });
                  }, child: Image.asset('assets/scissors.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(onPressed: () { // 보 버튼
                    setState(() {
                      playGame.clickRandom();
                      playGame.score();
                      playGame.meClick(2);
                    });
                  }, child: Image.asset('assets/paper.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60.0,
            ),
            Text('컴퓨터: ${playGame.computer.toString()}', // 컴퓨터에서 랜덤 생성한 버튼 표시
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('나: ${playGame.me.toString()}', // 내가 선택한 버튼 표시
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('내 점수: ${playGame.myCounter.toString()}', // 내가 이겼을 경우 내 점수 +1
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('게임 횟수: ${playGame.counter.toString()}', // 바위, 가위, 보 중 버튼을 누를 때마다 게임 횟수 +1
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
              child: TextButton(onPressed: () { // 초기화 버튼을 누르면 컴퓨터에서 랜덤 생성한 버튼, 내가 누른 버튼, 내 점수, 게임 횟수가 모두 0으로 초기화
                setState(() {
                  playGame.me = 0;
                  playGame.computer = 0;
                  playGame.counter = 0;
                  playGame.myCounter = 0;
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

