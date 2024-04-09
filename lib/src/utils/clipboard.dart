import 'package:flutter/services.dart';

class ClipboardService {
  Future<String> paste() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    return clipboardData?.text ?? "Texto não encontrado";
  }
}