import 'package:daltons/bouton.dart';
import 'package:daltons/customappbar.dart';
import 'package:flutter/material.dart';
import 'rectangle.dart';

class Play extends StatelessWidget {
  const Play({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 600,
                height: 200,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Image.network(
                      'https://flagcdn.com/w160/ua.png',
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
                children: List.generate(
                  6,
                      (index) => Bouton(
                    text: 'Button \${index + 1}',
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}