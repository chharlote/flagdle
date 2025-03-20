import 'package:flutter/material.dart';
import 'countryStore.dart';

class CustomPopup {
  static void show(BuildContext context, {required Country country}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(country.countryName, style: const TextStyle(fontWeight: FontWeight.bold)), // Affiche le nom du pays
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Capitale : ${country.capital}\n'),
                Text('Continent : ${country.continent}\n'),
                Text('Président(e) : ${country.presidentName}\n'),
                Text('Superficie : ${country.size} \n'),
                Text('Population : ${country.population} habitants\n'),
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
