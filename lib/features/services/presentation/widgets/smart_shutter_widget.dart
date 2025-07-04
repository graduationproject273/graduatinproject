import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/features/services/presentation/cubit/services_cubit.dart';
import 'package:gradution/features/services/presentation/widgets/row_selection_numbers.dart';
import 'package:gradution/features/services/presentation/widgets/text_in_checkbox.dart';

class SmartShutterWidget extends StatefulWidget {
  const SmartShutterWidget({super.key});

  @override
  State<SmartShutterWidget> createState() => _SmartShutterWidgetState();
}

class _SmartShutterWidgetState extends State<SmartShutterWidget> {
  bool shutterSelected = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ServicesCubit>();

    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: shutterSelected,
              activeColor: maincolor,
              onChanged: (value) {
                setState(() {
                  shutterSelected = value!;
                  cubit.optionalFeatures['shutter'] = value ? 'enabled' : 'disabled';
                });
              },
            ),
            const SizedBox(width: 10),
            Expanded(child: TextInCheckbox(text: 'Smart Shutter')),
          ],
        ),
        if (shutterSelected) const RowNumbersInSelection(),
      ],
    );
  }
}