import 'package:daltons/appBar.dart';
import 'package:daltons/pageStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(FlagGuessingApp());
}

class FlagGuessingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess the Flag',
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppStoreState state = ref.watch(appStoreProvider);
    final AppStore store = ref.read(appStoreProvider.notifier);
    
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome in Flagdle!',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => store.openPlay(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150,70),
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Play', style: Theme.of(context).textTheme.labelLarge),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => store.openCredit(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150,70),
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Credit', style: Theme.of(context).textTheme.labelLarge),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => store.exit(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150,70),
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Exit', style: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          ),
        ),
      ),
    );
  }
}