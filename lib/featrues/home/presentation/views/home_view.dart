import 'package:flutter/material.dart';
import 'package:gradution/core/routeing/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Center(
            child:GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.categories);
            })
          ),
          Center(
            child:GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.blog);
            })
          ),
          Center(
            child:GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.products);
            })
          ),
           Center(
            child:GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.profile);
            })
          ),
        ],
      )
    );
  }
}