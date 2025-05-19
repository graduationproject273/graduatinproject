import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution/core/styles/textstyles.dart';

class PaymentsWidets extends StatelessWidget {
  const PaymentsWidets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]
            ),
            child: Row(
              children: [
                 Icon(CupertinoIcons.cart_fill),
                 SizedBox(width: 10,),
                 Column(
                  children: [
                    Text('Payments',style: Textstyles.namereview,),
                    SizedBox(height: 5,),
                    Text('2000',style: Textstyles.namereview,)
                  ],
                 )
              ],
            ),
          ),
        ],
      ),
    );
  }
}