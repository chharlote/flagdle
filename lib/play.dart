import 'package:daltons/bouton.dart';
import 'package:daltons/popUpCountry.dart';
import 'package:daltons/popUpFalseCountry.dart';
import 'package:flutter/material.dart';
import 'appBar.dart';
import 'package:daltons/countryStore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import 'gameStore.dart';
class Play extends ConsumerWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryState = ref.watch(countryStoreProvider);
    final gameStore = ref.watch(appStoreProvider);

    if (countryState == null || countryState.countries.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final countryStore = ref.read(countryStoreProvider.notifier);
    final selectedCountry = countryStore.getOneRandomCountry();

    List<Country> otherCountries = countryState.countries
        .where((c) => c.iso2 != selectedCountry.iso2)
        .toList();

    otherCountries.shuffle();
    List<Country> options = [selectedCountry, ...otherCountries.take(5)];

    options.shuffle();

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pinkAccent, Colors.deepPurple],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score: ${gameStore.score}',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 1),

              Container(
                width: 600,
                height: 200,
                color: Colors.purple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Image.network(
                      'https://flagcdn.com/w160/${selectedCountry.iso2.toLowerCase()}.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 60,
                mainAxisSpacing: 20,
                children: options.map((country) {
                  return Bouton(
                    text: country.countryName,
                    onPressed: () {
                      if (country.iso2 == selectedCountry.iso2) {
                        CustomPopup.show(context, country: country);
                        ref.read(appStoreProvider.notifier).increaseScore();
                      } else {
                        FalseCountryPopup.show(context, country: selectedCountry);
                        ref.read(appStoreProvider.notifier).mantainScore();
                      }
                    },
                  );
                }).toList(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
