import 'package:flutter/material.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';

class UploadPhotoRow extends StatelessWidget {
  const UploadPhotoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Add a photo', style: Textstyles.namereview.copyWith(fontSize: 19)),
        const SizedBox(width: 60),
        SizedBox(
          width: 150,
          child: CustomButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.upload, color: Colors.white),
                const SizedBox(width: 10),
                Text('Upload', style: Textstyles.namereview.copyWith(fontSize: 19, color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
