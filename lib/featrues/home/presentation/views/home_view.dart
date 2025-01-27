import 'package:flutter/material.dart';

import 'package:gradution/featrues/home/presentation/views/wedgets/landing_video.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /// The landing video.
          ///
          /// The video is displayed in a [SizedBox] with a height and width of
          /// 300 pixels.
          SizedBox(
            height: 300,
            width: 300,
            child: LandingVideoScreen(),
          ),
        ],
      ),
    );
  }
}