import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/profile/profile_cubit.dart';

class SellerDashboardDrawer extends StatefulWidget {
  const SellerDashboardDrawer({super.key});

  @override
  State<SellerDashboardDrawer> createState() => _SellerDashboardDrawerState();
}

class _SellerDashboardDrawerState extends State<SellerDashboardDrawer> {
  final Color primaryColor = const Color(0xFF00917C);

  final List<IconData> iconss = [
    Icons.dashboard_outlined,

    Icons.production_quantity_limits_outlined,
    CupertinoIcons.cart_fill,
    Icons.payment,
    Icons.inventory_2_outlined,
    CupertinoIcons.add_circled,
    Icons.payment_outlined,
  ];

  final List<String> titles = [
    'Orders',
    'Products',
    'Add Products',
    'Payments',
  ];

  final List<IconData> icons2 = [
    Icons.person_outline,
    Icons.logout_outlined,
  ];

  final List<String> titles2 = [
    'Account',
    'Logout',
  ];

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).push(Routes.order);
        break;
      case 1:
        GoRouter.of(context).push(Routes.sellerProducts);
        break;
      case 2:
        GoRouter.of(context).push(Routes.addsellerProducts);
        break;
      case 3:
        GoRouter.of(context).push(Routes.payments);
        break;

      default:
        GoRouter.of(context).go(Routes.dashboardseller);
    }
  }

  void showLogoutDialog(BuildContext parentcontext) {
    showDialog(
      context: parentcontext,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.logout_outlined,
                color: Colors.red.shade600, size: 24.sp),
            SizedBox(width: 10.w),
            const Text("Confirm Logout",
                style: TextStyle(color: Colors.black87)),
          ],
        ),
        content: const Text(
          "Are you sure you want to logout?",
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:
                Text("Cancel", style: TextStyle(color: Colors.grey.shade600)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              parentcontext.read<ProfileCubit>().clearSeller();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
            ),
            child: const Text("Logout", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is RemoveSeller) {
          GoRouter.of(context).go(Routes.login);
        } else if (state is ProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.failure.errMessage)),
          );
        }
      },
      child: Drawer(
        child: Container(
          color: Colors.grey.shade50,
          child: Column(
            children: [
              // Header
              Container(
                height: 120.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Row(
                      children: [
                        Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            Icons.store_outlined,
                            color: primaryColor,
                            size: 24.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Seller Panel',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Menu Items
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),

                      // Main Menu
                      ...List.generate(
                        iconss.length,
                        (index) => Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 4.h),
                            leading: Container(
                              width: 35.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                iconss[index],
                                color: primaryColor,
                                size: 20.sp,
                              ),
                            ),
                            title: Text(
                              titles[index],
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Icon(
                              CupertinoIcons.chevron_right,
                              color: Colors.grey.shade400,
                              size: 16.sp,
                            ),
                            onTap: () => navigateToPage(context, index),
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Divider
                      Container(
                        height: 1.h,
                        width: double.infinity,
                        color: Colors.grey.shade200,
                        margin: EdgeInsets.symmetric(vertical: 20.h),
                      ),
                      // Bottom Menu
                      ...List.generate(
                        icons2.length,
                        (index) => Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 4.h),
                            leading: Container(
                              width: 35.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                color: index == 1
                                    ? Colors.red.withOpacity(0.1)
                                    : primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                icons2[index],
                                color: index == 1
                                    ? Colors.red.shade600
                                    : primaryColor,
                                size: 20.sp,
                              ),
                            ),
                            title: Text(
                              titles2[index],
                              style: TextStyle(
                                color: index == 1
                                    ? Colors.red.shade600
                                    : Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Icon(
                              CupertinoIcons.chevron_right,
                              color: Colors.grey.shade400,
                              size: 16.sp,
                            ),
                            onTap: () {
                              if (index == 1) {
                                showLogoutDialog(context);
                              } else if (index == 0) {
                                GoRouter.of(context).push(Routes.profileSeller);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
