import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';
import 'package:gradution/features/services/presentation/cubit/services_cubit.dart';

class SmartSensorsGridview extends StatefulWidget {
  const SmartSensorsGridview({super.key});

  @override
  State<SmartSensorsGridview> createState() => _SmartSensorsGridviewState();
}

class _SmartSensorsGridviewState extends State<SmartSensorsGridview> {
  final List<String> sensors = [
    "Door/Window Sensor",
    "Motion Sensor",
    "Temp/Humidity Sensor",
    "Smoke Sensor",
    "Gas Sensor",
    "Water Leakage Sensor",
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ServicesCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Smart Sensors'),
        SizedBox(
          height: context.height * 0.3,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3.7,
            ),
            itemCount: sensors.length,
            itemBuilder: (BuildContext context, int index) {
              final sensor = sensors[index];
              final isSelected = cubit.smartSensors.contains(sensor);

              return Row(
                children: [
                  Checkbox(
                    activeColor: maincolor,
                    value: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          cubit.smartSensors.add(sensor);
                        } else {
                          cubit.smartSensors.remove(sensor);
                        }
                      });
                    },
                  ),
                  Expanded(
                    child: Text(sensor),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}