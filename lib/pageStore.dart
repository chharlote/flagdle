import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  void openPlay(){

  }

  void openCredit(){

  }

  void exit(){

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