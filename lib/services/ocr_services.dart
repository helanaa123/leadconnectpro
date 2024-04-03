import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class OCRService{
  final TextRecognizer textRecognizer = GoogleMlKit.vision.textRecognizer();

  Future<String> extractTextFromImage(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    String extractedText = '';
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        extractedText += '${line.text}\n';
      }
    }

    return extractedText;
  }

  void dispose() {
    textRecognizer.close();
  }
}