import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/featrues/services/presentation/widgets/text_in_checkbox.dart';

class SmartLightingWidget extends StatefulWidget {
  const SmartLightingWidget({super.key});

  @override
  State<SmartLightingWidget> createState() => _SmartLightingWidgetState();
}

class _SmartLightingWidgetState extends State<SmartLightingWidget> {
  bool lightingSelected = false;
  final TextEditingController otherLightingController = TextEditingController();

  final List<String> _lightingOptions = [
    'ٍSmart switches',
    'Sensors',
    'In-wall Switches',
    'Control Panel',
    'Voice Command',
    'Other',
  ];

  final Set<String> selectedLightingOptions = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: lightingSelected,
              activeColor: maincolor,
              onChanged: (value) {
                setState(() {
                  lightingSelected = value!;
                });
              },
            ),
            const SizedBox(width: 10),
            Expanded(child: TextInCheckbox(text: 'Smart Lighting')),
          ],
        ),
        if (lightingSelected)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 8),
                child: Text(
                  "Lighting control by",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
              ),
              ..._lightingOptions.map((option) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: maincolor,
                        value: selectedLightingOptions.contains(option),
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              selectedLightingOptions.add(option);
                            } else {
                              selectedLightingOptions.remove(option);
                            }
                          });
                        },
                      ),
                      Text(option),
                    ],
                  ),
                );
              }),
              if (selectedLightingOptions.contains('Other'))
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: otherLightingController,
                    decoration: const InputDecoration(
                      hintText: "Please specify?",
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
