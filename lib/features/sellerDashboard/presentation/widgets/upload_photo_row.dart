import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/add_product_cubit/add_product_cubit.dart';


class UploadPhotoRow extends StatelessWidget {
  const UploadPhotoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProductCubit, AddProductState >(
      listener: (context, state) {
        if (state is AddImage) {
          context.read<AddProductCubit>().imageUrl = state.imageUrl;
          print(context.read<AddProductCubit>().imageUrl);
        } else if (state is ErrorImage) {
    
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Add a photo',
              style: Textstyles.namereview.copyWith(fontSize: 19)),
          const SizedBox(width: 60),
          SizedBox(
            width: 130.w,
            child: CustomButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.upload, color: Colors.white),
                  const SizedBox(width: 10),
                  InkWell(
                      onTap: () => context
                          .read<AddProductCubit>()
                          .pickAndUploadImage(),
                      child: Text('Upload',
                          style: Textstyles.namereview
                              .copyWith(fontSize: 19, color: Colors.white))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
