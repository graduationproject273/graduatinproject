import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/featrues/services/presentation/widgets/row_selection_numbers.dart';
import 'package:gradution/featrues/services/presentation/widgets/text_in_checkbox.dart';

class SmartCurtainWidget extends StatefulWidget {
  const SmartCurtainWidget({super.key});

  @override
  State<SmartCurtainWidget> createState() => _SmartCurtainWidgetState();
}

class _SmartCurtainWidgetState extends State<SmartCurtainWidget> {
  bool curtainSelected = false;
  String? curtainShape;
  final TextEditingController otherCurtainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: curtainSelected,
              activeColor: maincolor,
              onChanged: (value) {
                setState(() {
                  curtainSelected = value!;
                });
              },
            ),
            const SizedBox(width: 10),
            Expanded(child: TextInCheckbox(text: 'Smart Curtain')),
          ],
        ),
        if (curtainSelected)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Curtain shape*",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
              ),
              RadioListTile<String>(
                title: const Text("Straight Line"),
                value: "straightLine",
                activeColor: maincolor,
                groupValue: curtainShape,
                onChanged: (value) {
                  setState(() {
                    curtainShape = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text("L Shape"),
                value: "lShape",
                activeColor: maincolor,
                groupValue: curtainShape,
                onChanged: (value) {
                  setState(() {
                    curtainShape = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text("Curved"),
                value: "curved",
                activeColor: maincolor,
                groupValue: curtainShape,
                onChanged: (value) {
                  setState(() {
                    curtainShape = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text("Other"),
                value: "other",
                activeColor: maincolor,
                groupValue: curtainShape,
                onChanged: (value) {
                  setState(() {
                    curtainShape = value;
                  });
                },
              ),
              if (curtainShape == "other")
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: otherCurtainController,
                    decoration: const InputDecoration(
                      hintText: "Please specify?",
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              RowNumbersInSelection(),
            ],
          ),
      ],
    );
  }
}
