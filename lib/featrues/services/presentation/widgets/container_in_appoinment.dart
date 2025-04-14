import 'package:flutter/material.dart';

class ContainerInAppoinment extends StatelessWidget {
  const ContainerInAppoinment({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return   Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.2,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12),
                child: child
              );
  }
}