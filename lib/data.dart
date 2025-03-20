import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DataManager {
  final String fileName = 'data.json';

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  Future<void> writeData(String pseudo, int score) async {
    final file = await _getFile();
    Map<String, dynamic> data = {'pseudo': pseudo, 'score': score};
    String jsonData = jsonEncode(data);
    await file.writeAsString(jsonData);
  }

  Future<Map<String, dynamic>?> readData() async {
    try {
      final file = await _getFile();
      if (await file.exists()) {
        String jsonData = await file.readAsString();
        return jsonDecode(jsonData);
      }
    } catch (e) {
      print("Erreur lors de la lecture du fichier : $e");
    }
    return null;
  }
}
