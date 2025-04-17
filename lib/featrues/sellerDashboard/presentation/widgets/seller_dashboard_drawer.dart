import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';

class SellerDashboardDrawer extends StatelessWidget {
  const SellerDashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //padding: EdgeInsets.zero,
            children: <Widget>[
           
              ListTile(
                leading: Icon(Icons.dashboard_outlined,size: 24,color: maincolor,),
                title: Text('Dashboard',style: Textstyles.namereview.copyWith(color: maincolor),),
              ),
            
            ],
          ),
        ),
      );
  }
}