import 'dart:math';

class PlayGame{

  var computer=0;
  int me = 0;
  int counter = 0;
  int myCounter = 0;

  void meClick(int my){ // 내가 버튼을 선택했을 때 어떤 버튼을 선택했는지 인자를 받아 저장
    me = my;
  }

  void clickRandom(){ // 내가 버튼을 선택하면 컴퓨터에서 랜덤으로 버튼을 선택, 게임횟수 +1
    computer = Random().nextInt(3);
    counter++;
  }

  void score(){ // 랜덤 생성된 것과 내가 선택한 것을 비교하여 승자 판별, 내가 이겼을 경우 내 점수 +1

    // 컴퓨터가 바위를 낸 경우
    if(computer == 0) {
      if(me == 0) {print("비겼습니다");}
      else if (me == 1) {print("컴퓨터가 이겼습니다");}
      else if (me == 2) {
        myCounter++;
        print("플레이어가 이겼습니다");}
      print(myCounter);
    }

    // 컴퓨터가 가위를 낸 경우
    else if(computer == 1) {
      if(me == 0) {
        myCounter++;
        print("플레이어가 이겼습니다");}
      else if(me == 1) {print("비겼습니다");}
      else if (me == 2) {print("컴퓨터가 이겼습니다");}
      print(myCounter);
    }

    // 컴퓨터가 보를 낸 경우
    else if(computer == 2) {
      if(me == 0) {print("컴퓨터가 이겼습니다");}
      else if(me == 1) {
        myCounter++;
        print("플레이어가 이겼습니다");}
      else if (me == 2) {print("비겼습니다");}
      print(myCounter);
    }
  }
}

