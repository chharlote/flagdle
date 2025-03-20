import 'package:flutter/material.dart';
import 'countryStore.dart';

class FalseCountryPopup {
  static void show(BuildContext context, {required Country country}) {
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
                Text("La bonne réponse était : ${country.countryName}\n",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      },
    );
  }
}
