import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:cached_network_image/cached_network_image.dart';


class Categoriesitem extends StatelessWidget {
  const Categoriesitem({
    super.key, required this.text, required this.image,
  });
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83.h,
      height: 88.h,
      decoration: BoxDecoration(
        color: coloritemcat, // لون الخلفية
        borderRadius: BorderRadius.circular(8), // زوايا دائرية
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // الصورة
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:CachedNetworkImage(
              width: 44.w,
              height: 44.w,
              fit: BoxFit.fill,
  imageUrl: image,
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
)
          ),
          const SizedBox(height: 4),
          // الاسم
          Text(
            text,
            style: Textstyles.textitemcat,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
