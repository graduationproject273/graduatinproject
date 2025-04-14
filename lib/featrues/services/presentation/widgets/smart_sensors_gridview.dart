import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/extention.dart';

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

  final List<bool> selected = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
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
              return Row(
                children: [
                  Checkbox(
                    activeColor: maincolor,
                    value: selected[index],
                    onChanged: (bool? value) {
                      setState(() {
                        selected[index] = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(sensors[index]),
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
