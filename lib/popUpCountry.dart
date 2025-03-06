import 'package:flutter/material.dart';


class CustomPopup {

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text("", style: const TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Capitale : \n'),
                Text('Continent : \n'),
                Text('Président(e) : \n'),
                Text('Superficie : \n'),
                Text('Population : \n'),

              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Fermer", style: TextStyle(color: Colors.pinkAccent)),
            ),
          ],
        );
      },
    );
  }
}
