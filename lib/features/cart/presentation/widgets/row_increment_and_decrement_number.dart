import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';

class RowIncrementAndDecrementNumber extends StatefulWidget {
  const RowIncrementAndDecrementNumber({
    super.key,
    required this.id,
    required this.quantity,
    this.onQuantityChanged, // Optional callback
  });

  final int id;
  final int quantity;
  final Function(int quantity)? onQuantityChanged;

  @override
  State<RowIncrementAndDecrementNumber> createState() =>
      _RowIncrementAndDecrementNumberState();
}

class _RowIncrementAndDecrementNumberState
    extends State<RowIncrementAndDecrementNumber> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  void increment() {
    setState(() {
      quantity++;
    });
    context.read<CartCubit>().increaseQuantity(widget.id, quantity);
    widget.onQuantityChanged?.call(quantity); // Notify parent if needed
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
      context.read<CartCubit>().increaseQuantity(widget.id, quantity);
      widget.onQuantityChanged?.call(quantity); // Notify parent if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // زر (-)
        CircleAvatar(
          backgroundColor: maincolor,
          radius: 15.sp,
          child: IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.white,
              size: 15.sp,
            ),
            onPressed: decrement,
          ),
        ),
        const SizedBox(width: 16),
        // الرقم
        Text(
          '$quantity',
          style: Textstyles.textitemcartnumber,
        ),
        const SizedBox(width: 16),
        // زر (+)
        CircleAvatar(
          backgroundColor: maincolor,
          radius: 15.sp,
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 15.sp,
            ),
            onPressed: increment,
          ),
        ),
      ],
    );
  }
}
