import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';

class SellerDashboardDrawer extends StatefulWidget {
  const SellerDashboardDrawer({super.key});

  @override
  State<SellerDashboardDrawer> createState() => _SellerDashboardDrawerState();
}

class _SellerDashboardDrawerState extends State<SellerDashboardDrawer> {
  
  final List<IconData> iconss = [
    Icons.dashboard_outlined,
    Icons.production_quantity_limits_outlined,
    CupertinoIcons.cart_fill,
    Icons.transform,
    Icons.payment,
   
  ];
final List<String> titles = [
    'Orders',
    'Products',
    'Add Products',
    'Transactions',
    'Payments',
  
  ];
void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(Routes.dashboardseller);
        break;
      case 1:
       GoRouter.of(context).push(Routes.sellerProducts);
        break;
      case 2:
        GoRouter.of(context).push(Routes.addsellerProducts);
        break;
      case 3:
         GoRouter.of(context).push(Routes.reviews);
        break;
         case 4:
         GoRouter.of(context).push(Routes.reviews);
        break;
     
      default:
         GoRouter.of(context).go(Routes.home);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //padding: EdgeInsets.zero,
            children: <Widget>[
           SizedBox(height: 30.h,),
              ListTile(
                leading: Icon(Icons.dashboard_outlined,size: 24,color: maincolor,),
                title: Text('Dashboard',style: Textstyles.namereview.copyWith(color: maincolor),),
                
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: List.generate(iconss.length, (index) {
                return ListTile(
                    leading: Icon(iconss[index],size: 24,color: maincolor,),
                  title: Text(titles[index],style: Textstyles.namereview.copyWith(color: maincolor),),
                  onTap: () {
                    navigateToPage(context, index);
                  },
                );
              },)),
            )
            ],
          ),
        ),
      );
  }
}