import 'package:flutter/material.dart';

class FalseCountryPopup {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 28),
              SizedBox(width: 10),
              Text("Mauvaise réponse !", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Désolé, la réponse est incorrecte.\nEssaye encore !",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Réessayer", style: TextStyle(color: Colors.pinkAccent)),
            ),
          ],
        );
      },
    );
  }
}
