import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppConst.dart';


final countryStoreProvider = StateNotifierProvider<CountryStore, AppCountryState?>((ref) {
  return CountryStore();
});

class CountryStore extends StateNotifier<AppCountryState?> {
  CountryStore() : super(null) {
    _loadPreviousData();
  }

  Future<void> _loadPreviousData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var prevHeight = prefs.getDouble("heightKey");
  }

  Future<void> getCountries() async {
    final apiKey = AppConst.API_KEY;
    final url = Uri.parse('https://restfulcountries.com/api/v1/countries?token=$apiKey');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      if (jsonData['data'] is List) {
        List<Country> countries = (jsonData['data'] as List)
            .map((e) => Country.fromJson(e))
            .toList();
        state = AppCountryState(countries: countries);
      } else {
        throw Exception('La clé "data" ne contient pas une liste de pays.');
      }
    } else {
      throw Exception('Échec du chargement des pays: ${response.body}');
    }
  }



}

class AppCountryState {
  final List<Country> countries;

  AppCountryState({required this.countries});
}

class Country {
  final String countryName;
  final String capital;
  final String iso2;
  final String continent;
  final String size;
  final String population;
  final String presidentName;

  Country({
    required this.countryName,
    required this.capital,
    required this.iso2,
    required this.continent,
    required this.size,
    required this.population,
    required this.presidentName,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryName: json['name'] ?? '',
      capital: json['capital'] ?? '',
      iso2: json['iso2'] ?? '',
      continent: json['continent'] ?? '',
      size: json['size'] ?? '',
      population: json['population'] ?? '',
      presidentName: json['current_president']?['name'] ?? '',
    );
  }
}

