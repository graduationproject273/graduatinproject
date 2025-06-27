import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/features/services/presentation/widgets/drowp_down_home_type.dart';
import 'package:gradution/features/services/presentation/cubit/services_cubit.dart';

class SmartDoorLock extends StatefulWidget {
  const SmartDoorLock({super.key});

  @override
  State<SmartDoorLock> createState() => _SmartDoorLockState();
}

class _SmartDoorLockState extends State<SmartDoorLock> {
  String selectedType = '';
  final TextEditingController locksCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ServicesCubit>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type of locks*',
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
          ),
          DrowpDownHomeType(
            options: ["wood", "material", "glass"],
            value: selectedType,
            onChanged: (String? newValue) {
              setState(() {
                selectedType = newValue ?? '';
                cubit.optionalFeatures['door_lock_type'] = selectedType;
              });
            },
          ),
          SizedBox(height: 10.h),
          Text(
            'Number of locks*',
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
          ),
          CustomTextformfield(
            controller: locksCountController,
            onSaved: (value) {
              // Update immediately when text changes
              cubit.optionalFeatures['door_lock_count'] = value!;
              return null;
            },
            hintText: 'i.e 2 locks',
            keyboardType: TextInputType.number,
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: maincolor,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          CustomButton(text: '+ upload Door photo'),
        ],
      ),
    );
  }
}