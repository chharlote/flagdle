import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(CountryFlagApp());
}

class CountryFlagApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlagScreen(),
    );
  }
}

class FlagScreen extends StatefulWidget {
  @override
  _FlagScreenState createState() => _FlagScreenState();
}

class _FlagScreenState extends State<FlagScreen> {
  String countryCode = "fr"; // Code ISO du pays (ex: 'fr' pour la France)
  String flagUrl = "";

  @override
  void initState() {
    super.initState();
    fetchFlag();
  }

  Future<void> fetchFlag() async {
    final response = await http.get(
      Uri.parse("https://restcountries.com/v3.1/alpha/$countryCode"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        flagUrl = data[0]['flags']['png']; // URL du drapeau
      });
    } else {
      throw Exception("Échec du chargement du drapeau");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drapeau du Pays")),
      body: Center(
        child: flagUrl.isNotEmpty
            ? Image.network(flagUrl, width: 200, height: 150)
            : CircularProgressIndicator(),
      ),
    );
  }
}
