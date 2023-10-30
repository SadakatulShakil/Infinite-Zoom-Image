import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        panEnabled: true,
        maxScale: 16000000,
        minScale: .5,
        child: Center(
          child: Stack(
            children: [
              _buildImage('images/image2.jpeg', 4.0),
              _buildImage('images/image3.png', 0.1),
              _buildImage('images/image1.jpg', 0.0005),
              _buildImage('images/image4.jpeg', 0.000003),
              _buildImage('images/image5.jpg', 0.0000003),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imageName, double scale) {
    return Transform.scale(
      scale: scale,
      alignment: Alignment.center,
      child: Image.asset(
        'assets/$imageName',
        width: 200.0,
        height: 200.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

// import 'dart:ui' as ui;
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: InteractiveViewer(
//         panEnabled: true,
//         maxScale: 16000000.0,
//         minScale: 0.5,
//         boundaryMargin: EdgeInsets.all(1000.0),
//         child: Center(
//           child: CustomPaint(
//             painter: ImageStackPainter(),
//             child: SizedBox(
//               width: 200.0,
//               height: 200.0,
//               child: Image.asset(
//                 'assets/images/image1.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ImageStackPainter extends CustomPainter {
//   final List<ui.Image> images = [];
//
//   @override
//   Future<void> paint(Canvas canvas, Size size) async {
//     if (images.isEmpty) {
//       await _preloadImages();
//     }
//
//     final double baseScale = 0.5;
//     final double scaleIncrement = 0.5;
//
//     for (int i = images.length - 1; i >= 0; i--) {
//       final double scale = baseScale + i * scaleIncrement;
//       final Rect rect = Rect.fromLTWH(
//         (size.width - 200.0) / 2,
//         (size.height - 200.0) / 2,
//         200.0,
//         200.0,
//       );
//
//       canvas.save();
//       canvas.scale(scale, scale);
//
//       final ui.Image image = images[i];
//
//       canvas.drawImageRect(
//         image,
//         Rect.fromPoints(Offset(0, 0), Offset(200.0, 200.0)),
//         rect,
//         Paint(),
//       );
//       canvas.restore();
//     }
//   }
//
//   Future<void> _preloadImages() async {
//     final List<String> imagePaths = [
//       'assets/images/image2.jpeg',
//       'assets/images/image3.png',
//       'assets/images/image1.jpg',
//       'assets/images/image4.jpeg',
//       'assets/images/image5.jpg',
//     ];
//
//     for (int i = 0; i < imagePaths.length; i++) {
//       final ByteData data = await rootBundle.load(imagePaths[i]);
//       final Uint8List bytes = data.buffer.asUint8List();
//       final ui.Codec codec = await ui.instantiateImageCodec(bytes);
//       final ui.FrameInfo frameInfo = await codec.getNextFrame();
//       images.add(frameInfo.image);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

