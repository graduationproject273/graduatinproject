import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:gradution/features/services/presentation/widgets/drop_down_date.dart';
import 'package:gradution/features/services/presentation/widgets/drowp_down_home_type.dart';
import 'package:gradution/features/services/presentation/cubit/services_cubit.dart';

class BodyAboutYourHome extends StatefulWidget {
  const BodyAboutYourHome({super.key});

  @override
  State<BodyAboutYourHome> createState() => _BodyAboutYourHomeState();
}

class _BodyAboutYourHomeState extends State<BodyAboutYourHome> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ServicesCubit, ServicesState>(
      listener: (context, state) {
        if (state is ServicesUpdated) {
          setState(() {});
        }
      },
      child: Builder(
        builder: (context) {
          final cubit = context.read<ServicesCubit>();

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColumnTextDrowpDown(
                    text: 'Home Type *',
                    options: ['House /Villa', 'Apartment', 'Chalet'],
                    value: cubit.selectedHomeType,
                    onChanged: cubit.updateHomeType,
                  ),
                  SizedBox(height: 30.h),

                  ColumnTextDrowpDown(
                    text: 'Home Status*',
                    options: ['Finished', 'Under Construct'],
                    value: cubit.selectedHomeStatus,
                    onChanged: cubit.updateHomeStatus,
                  ),
                  SizedBox(height: 30.h),

                  ColumnTextDrowpDown(
                    text: 'Home Size*',
                    options: [
                      'less than 100 m2',
                      'between 100 and 200 m2',
                      'between 200 and 300 m2',
                      'between 300 and 400 m2',
                    ],
                    value: cubit.selectedHomeSize,
                    onChanged: cubit.updateHomeSize,
                  ),
                  SizedBox(height: 30.h),

                  Text('Number of levels*', style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                  CustomTextformfield(
                    hintText: 'i.e 2 floors',
                    keyboardType: TextInputType.number,
                    controller: cubit.numberOfLevelsController,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: maincolor),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  Text('Number of rooms*', style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                  CustomTextformfield(
                    hintText: 'i.e 2 rooms',
                    keyboardType: TextInputType.number,
                    controller: cubit.numberOfRoomsController,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: maincolor),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  Text('Installation date*', style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                  DropdownDatePicker(
                    onDateSelected: cubit.updateInstallationDate,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ColumnTextDrowpDown extends StatelessWidget {
  final String text;
  final List<String> options;
  final String? value;
  final void Function(String?) onChanged;

  const ColumnTextDrowpDown({
    super.key,
    required this.text,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
        ),
        DrowpDownHomeType(
          options: options,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}