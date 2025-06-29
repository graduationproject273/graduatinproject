
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/ai/presentation/cubit/ocr_cubit.dart';

class ChoiceBetwwenOcrandAnalyze extends StatelessWidget {
  const ChoiceBetwwenOcrandAnalyze({
    super.key,
    required this.primaryColor,
  });

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => context.read<OcrCubit>().setProcessType(ImageProcessType.ocr),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: context.watch<OcrCubit>().selectedProcessType == ImageProcessType.ocr
                    ? primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'OCR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: context.watch<OcrCubit>().selectedProcessType == ImageProcessType.ocr
                      ? Colors.white
                      : primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => context.read<OcrCubit>().setProcessType(ImageProcessType.analysis),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: context.watch<OcrCubit>().selectedProcessType == ImageProcessType.analysis
                    ? primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Analyze Image',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: context.watch<OcrCubit>().selectedProcessType == ImageProcessType.analysis
                      ? Colors.white
                      : primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
