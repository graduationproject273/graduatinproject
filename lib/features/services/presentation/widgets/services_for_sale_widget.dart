import 'package:flutter/material.dart';
import 'package:gradution/features/services/presentation/widgets/smart_curtain_widget.dart';
import 'package:gradution/features/services/presentation/widgets/smart_lighting_widget.dart';
import 'package:gradution/features/services/presentation/widgets/smart_shutter_widget.dart';

class ServicesForSaleWidget extends StatelessWidget {
  const ServicesForSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 20),
              SmartLightingWidget(),
              SizedBox(height: 20),
              SmartCurtainWidget(),
              SizedBox(height: 20),
              SmartShutterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
