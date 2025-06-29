
import 'package:flutter/material.dart';

class NoImagesSelected extends StatelessWidget {
  const NoImagesSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image_search, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No image selected yet',
            style: TextStyle(fontSize: 16, color: Colors.grey[500]),
          ),
          const SizedBox(height: 8),
          Text(
            'Choose an image to start processing',
            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}
