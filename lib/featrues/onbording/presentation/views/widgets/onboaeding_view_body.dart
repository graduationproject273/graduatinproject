import 'package:flutter/material.dart';


class OnboaedingViewBody extends StatefulWidget {
  const OnboaedingViewBody({super.key});

  @override
  State<OnboaedingViewBody> createState() => _OnboaedingViewBodyState();
}

class _OnboaedingViewBodyState extends State<OnboaedingViewBody> {
  
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: 
         PageView(
            children: [
           
         ])
        ),
      ],
    );
  }
}