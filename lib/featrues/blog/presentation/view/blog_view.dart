import 'package:flutter/material.dart';
import 'package:gradution/core/routeing/routes.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
      ),
      body: Column(
        children: [
          Center(
            child:GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.blogDetails);
            })
          ),
        ],
      ),
    );
  }
}