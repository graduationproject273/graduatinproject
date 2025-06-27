// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/services/presentation/widgets/build_checkbox.dart';
import 'package:gradution/features/services/presentation/widgets/indoor_camera_system.dart';
import 'package:gradution/features/services/presentation/widgets/smart_door_lock.dart';
import 'package:gradution/features/services/presentation/widgets/smart_sensors_gridview.dart';
import 'package:gradution/features/services/presentation/cubit/services_cubit.dart';

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

  void _updateSensor(String sensor, bool enabled, ServicesCubit cubit) {
    if (enabled) {
      if (!cubit.smartSensors.contains(sensor)) {
        cubit.smartSensors.add(sensor);
      }
    } else {
      cubit.smartSensors.remove(sensor);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ServicesCubit>();

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

                    // Remove all related sensors if unchecked
                    cubit.smartSensors.removeWhere((sensor) =>
                      sensor == "Smart Door Lock" ||
                      sensor == "Indoor Camera" ||
                      sensor == "Outdoor Camera"
                    );
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
                        _updateSensor("Smart Door Lock", value, cubit);
                      },
                    ),
                    if (showSmartDoorLock) const SmartDoorLock(),

                    BuildCheckbox(
                      title: "Indoor Camera System",
                      value: showIndoorCamera,
                      onChanged: (value) {
                        setState(() => showIndoorCamera = value);
                        _updateSensor("Indoor Camera", value, cubit);
                      },
                    ),
                    if (showIndoorCamera) const IndoorCameraSystem(),

                    BuildCheckbox(
                      title: "Outdoor Camera System",
                      value: showOutdoorCamera,
                      onChanged: (value) {
                        setState(() => showOutdoorCamera = value);
                        _updateSensor("Outdoor Camera", value, cubit);
                      },
                    ),

                    const SmartSensorsGridview(), // يفترض أنك تعمل ربط داخلي له كمان
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
