import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/featrues/services/presentation/widgets/build_checkbox.dart';
import 'package:gradution/featrues/services/presentation/widgets/indoor_camera_system.dart';
import 'package:gradution/featrues/services/presentation/widgets/smart_door_lock.dart';
import 'package:gradution/featrues/services/presentation/widgets/smart_sensors_gridview.dart';

class BodySmartApplication extends StatefulWidget {
  const BodySmartApplication({super.key});

  @override
  _BodySmartApplicationState createState() => _BodySmartApplicationState();
}

class _BodySmartApplicationState extends State<BodySmartApplication> {
  bool showMainCheckbox = false;
  bool showSmartDoorLock = false;
  bool showIndoorCamera = false;
  bool showOutdoorCamera = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildCheckbox(
              title: "Smart Security",
              value: showMainCheckbox,
              onChanged: (value) {
                setState(() {
                  showMainCheckbox = value;
                  if (!value) {
                    showSmartDoorLock = false;
                    showIndoorCamera = false;
                    showOutdoorCamera = false;
                  }
                });
              },
            ),

            SizedBox(height: 10.h),

            if (showMainCheckbox)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildCheckbox(
                      title: "Smart Door Lock",
                      value: showSmartDoorLock,
                      onChanged: (value) {
                        setState(() => showSmartDoorLock = value);
                      },
                    ),
                    if (showSmartDoorLock) const SmartDoorLock(),

                    BuildCheckbox(
                      title: "Indoor Camera System",
                      value: showIndoorCamera,
                      onChanged: (value) {
                        setState(() => showIndoorCamera = value);
                      },
                    ),
                    if (showIndoorCamera) const IndoorCameraSystem(),

                    BuildCheckbox(
                      title: "Outdoor Camera System",
                      value: showOutdoorCamera,
                      onChanged: (value) {
                        setState(() => showOutdoorCamera = value);
                      },
                    ),

                    const SmartSensorsGridview(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  
}