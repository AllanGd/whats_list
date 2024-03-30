import 'package:flutter/services.dart';

class ClipboardController {
  static Future<String> colar() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    return clipboardData?.text ?? "Texto não encontrado";
  }
}
