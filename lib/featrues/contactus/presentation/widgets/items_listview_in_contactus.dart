import 'package:flutter/material.dart';
import 'package:gradution/constants/images.dart';
import 'package:gradution/featrues/contactus/presentation/widgets/item_in_contactus.dart';

class ItemsListviewInContactus extends StatelessWidget {
   ItemsListviewInContactus({super.key});
  final List<String> images =[
    Assets.imagesInsta,
    Assets.imagesEmail,
    Assets.imagesPhone
  ];
  final List<String> text1 =[
    'Instagram',
    'Email',
    'Phone'
  ];
  final List<String> text2 =[
    '@gradution',
    '4V2d0@example.com',
    'Available 24/7'
  ];
  @override
  Widget build(BuildContext context) {
    final screenheight= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: screenheight*.7,
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 11.0),
            child: ItemInContactus(
              image: images[index],
              text1: text1[index],
              text2: text2[index],
            ),
          ),
           itemCount: 3,),
      ),
    );
  }
}