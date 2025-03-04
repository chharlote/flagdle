import 'package:flutter/material.dart';
import 'appBar.dart';

class Credit extends StatelessWidget {
  const Credit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(), // Correction ici
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Cette application est un projet réalisé en Flutter visant à faire interagire un utilisateur et une API',
              style: TextStyle(color: Colors.white, fontSize: 19)),
            SizedBox(height: 500),

            Text(
              'Développeurs :',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            SizedBox(height: 20),
            Text(
              '- Fontaine Aurélien\n- Pinceel Matthieu\n- Germe Charlotte\n- Deletang-Devin Noa',
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.pink, // Pour que le texte blanc soit visible
    );
  }
}
