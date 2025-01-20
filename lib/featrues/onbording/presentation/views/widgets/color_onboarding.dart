import 'package:flutter/material.dart';

// ignore: camel_case_types
class coloronboarding extends StatelessWidget {
  const coloronboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width, 
       height: MediaQuery.of(context).size.height ,
       decoration: BoxDecoration(
         gradient: LinearGradient(
           colors: [
             Colors.transparent, // لون أغمق
             Colors.black, // شفاف
           ],
           begin: Alignment.topCenter, // يبدأ من الأعلى
           end: Alignment.bottomCenter, // ينتهي في الأسفل
         ),
       ),
     );
  }
}
