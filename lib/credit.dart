import 'package:flutter/material.dart';
import 'appBar.dart';

class Credit extends StatelessWidget {
  const Credit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pinkAccent, Colors.deepPurple],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Cette application est un projet réalisé en Flutter visant à faire interagir un utilisateur avec une API.\n\n'
                        'Ce jeu challenge les joueurs sur leurs connaissances des drapeaux du monde entier.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                'Développeurs :',
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              buildNomDevs('Pinceel Matthieu'),
              buildNomDevs('Germe Charlotte'),
              buildNomDevs('Deletang-Devin Noa'),
              buildNomDevs('Fontaine Aurélien'),

              const SizedBox(height: 40),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildNomDevs(String name) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: const Icon(Icons.person, color: Colors.purpleAccent, size: 30),
        title: Text(name, style: const TextStyle(fontSize: 20, color: Colors.black87)),
      ),
    );
  }
}
