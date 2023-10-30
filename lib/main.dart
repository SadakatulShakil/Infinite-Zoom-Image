import 'package:flutter/material.dart';

import 'Screens/stack_images.dart';
import 'Screens/video_screen.dart';

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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StackImagesPage(),
                ),
              );
              // Handle the left-side button click
              print('Left-side button clicked!');
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VideoScreen(),
                ),
              );
              print('Video button clicked!');
            },
            child: Icon(Icons.video_library),
          ),
        ],
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
