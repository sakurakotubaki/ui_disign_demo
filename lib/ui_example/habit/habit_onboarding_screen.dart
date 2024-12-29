import 'package:flutter/material.dart';

class HabitOnboardingScreen extends StatelessWidget {
  const HabitOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 下部のピンク部分
          Container(
            color: Color(0xFFFFC0CB), // ピンク色
          ),

          // 上部の黒い部分（波形の形状）
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65, // 高さを65%に修正
              width: double.infinity, // 幅を最大に
              color: Colors.black,
              padding: EdgeInsets.fromLTRB(24, 60, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height:
                          MediaQuery.of(context).padding.top), // ステータスバーの高さを考慮
                  Text(
                    'We will help you to',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'make habits!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 中央の自転車アイコン
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45, // 位置を下に調整
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '🚲',
                style: TextStyle(
                  fontSize: 100,
                ),
              ),
            ),
          ),

          // 下部のテキストとボタン
          Positioned(
            bottom: 40, // 下からの距離を調整
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'This application helps you get rid of bad habits and making good ones in more a better life',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 40),
                // 円形の次へボタン
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 修正された波形のクリッパー
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.85); // 開始位置を下に

    // よりなだらかな曲線を描く
    var firstControlPoint = Offset(size.width * 0.25, size.height);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.85);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint = Offset(size.width * 0.75, size.height * 0.7);
    var secondEndPoint = Offset(size.width, size.height * 0.85);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0); // 右端
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
