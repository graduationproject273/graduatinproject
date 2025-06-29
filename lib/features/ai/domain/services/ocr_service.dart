import 'dart:io';
import 'package:gradution/features/ai/data/models/ocr_model.dart';
import 'package:gradution/features/ai/data/models/room_analysis.dart';

abstract class OcrService {
  Future<OcrResult> uploadImageForOcr(File imageFile);
  Future<RoomAnalysisModel> uploadanalysesimage(File imageFile);
}
