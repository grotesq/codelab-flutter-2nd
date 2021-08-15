import 'package:flutter/material.dart';

class ResultC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'C. 손바닥이 위로 오고 손가락 사이를 벌린 사람' ),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset('lib/assets/hand-type-c.png', width: 300, height: 300),
          ),
          Text('C. 손바닥이 위로 오고 손가락 사이를 벌린 사람'),
          Text('당신은 무시당하는걸 싫어하며 누군가에게 호감이 있어도 잘 표현하지 않는 편입니다. 기분이 안좋은일이 생기면 혼자 숨어서 울때도 있습니다. 쉽게 감정이 얼굴에 드러나지 않아 자신의 슬픔은 숨기지만 누군가가 위로해 주기를 원합니다. 환상속의 완벽한 일들이 일어날 수 있다고 믿는 당신은 친절하고 낭만적인 성격을 가지고 있으나 낮선이의 앞에선 조용한 편입니다. 그러나 의외로 애교를 잘 부리는 귀여운 성격을 가지고 있습니다. 기분대로 행동하려는 것만 조심하면 굉장히 사랑받을 타입 입니다.'),
        ],
      ),
    );
  }
}
