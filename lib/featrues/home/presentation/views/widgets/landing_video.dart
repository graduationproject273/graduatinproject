import 'package:flutter/material.dart';
import 'package:gradution/constants/images.dart';
import 'package:video_player/video_player.dart';

class LandingVideoScreen extends StatefulWidget {
  const LandingVideoScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LandingVideoScreenState createState() => _LandingVideoScreenState();
}

class _LandingVideoScreenState extends State<LandingVideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // اختر الفيديو (محلي أو من الشبكة)
    _controller = VideoPlayerController.asset(Assets.imagesLandingvideo) // فيديو محلي
      ..initialize().then((_) {
        // تشغيل الفيديو تلقائيًا
        _controller.play();
        // تشغيل الفيديو في وضع التكرار
        _controller.setLooping(false);

       

        setState(() {});
      });
  }

 

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(), // عرض مؤشر أثناء تحميل الفيديو
      ),
    );
  }
}

