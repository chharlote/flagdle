import 'package:daltons/countryStore.dart';
import 'package:daltons/homePage.dart';
import 'package:daltons/popUpCountry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daltons/credit.dart';



final appStoreProvider = StateNotifierProvider<AppStore, AppStoreState>((ref){
  return AppStore();
});

class AppStore extends StateNotifier<AppStoreState>{
  AppStore() : super(AppStoreState.init()) {
      SharedPreferences.getInstance().then((prefs) {
    });
  }

  AppStoreState getState(){
    return state;
  }


  void openPlay(BuildContext context) {
  }

  void openCredit(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Credit()));
  }

  void exit(BuildContext context){
    SystemNavigator.pop();
  }

  void openHome(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}


class AppStoreState {
  final double weightKg;
  final double heightCm;

  AppStoreState({required this.weightKg, required this.heightCm});

  AppStoreState copyWith({double? weightKg, double? heightCm}) {
    return AppStoreState(weightKg: weightKg ?? this.weightKg, heightCm: heightCm ?? this.heightCm);
  }

  factory AppStoreState.init(){
    return AppStoreState(weightKg: 100, heightCm: 100);
  }
}