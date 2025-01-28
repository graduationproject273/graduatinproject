import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/constants/images.dart';

ShowBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.grey[200],
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Text(
                  'Select a Payment Method',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: SizedBox(width: 50.w ,child: Image.asset(Assets.imagesStripe)),
                  title:  Text('Stripe',style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                   leading: SizedBox(width: 50.w, child: Image.asset(Assets.imagesPaypal)),
                  title:  Text('Paypal',style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                 
                  leading: const Icon(Icons.cancel,),
                  title: const Text('Cancel'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }