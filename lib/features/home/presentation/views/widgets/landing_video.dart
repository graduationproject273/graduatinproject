import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';
import 'package:video_player/video_player.dart';

class LandingVideoScreen extends StatefulWidget {
  const LandingVideoScreen({super.key});

  @override
  _LandingVideoScreenState createState() => _LandingVideoScreenState();
}

class _LandingVideoScreenState extends State<LandingVideoScreen>
    with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  bool _isVideoError = false;

  @override
  void initState() {
    super.initState();
    
    // إعداد الأنيميشن للـ fade effect
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // إعداد مشغل الفيديو
    _controller = VideoPlayerController.asset(Assets.imagesLandingvideo)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller.play();
          _controller.setLooping(true);
          _fadeController.forward();
        }
      }).catchError((error) {
        if (mounted) {
          setState(() {
            _isVideoError = true;
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: _isVideoError
          ? _buildErrorWidget()
          : _controller.value.isInitialized
              ? FadeTransition(
                  opacity: _fadeAnimation,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // الفيديو
                      FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                      // تدرج أمامي للتأثير البصري
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.3),
                            ],
                            stops: [0.0, 0.7, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : _buildLoadingWidget(),
    );
  }

  Widget _buildLoadingWidget() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF667eea),
            Color(0xFF764ba2),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6B73FF)),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Loading video...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFF6B6B),
            Color(0xFFFF8E8E),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                color: Color(0xFFFF6B6B),
                size: 32.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Unable to load video',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}