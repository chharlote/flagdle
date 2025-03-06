import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AppConst.dart';

final appStoreProvider = StateNotifierProvider<GameStore, GameStoreState>((ref) {
  return GameStore();
});

class GameStore extends StateNotifier<GameStoreState> {
  GameStore() : super(GameStoreState.init()) {
    SharedPreferences.getInstance().then((prefs) {
      var prevHeight = prefs.getDouble(AppConst.scoreKey);
    });
  }

  GameStoreState getState() {
    return state;
  }

  void setScore(int? value) {
    state = state.copyWith(score: value);
  }

  void resetValues() {
    setScore(AppConst.scoreDefault);
  }

  void saveValues() {
    final Future<SharedPreferences> future = SharedPreferences.getInstance();
    future.then((prefs) {
      prefs.setInt(AppConst.scoreKey, state.score);
    });
  }

  void modifyScore(int offset) {
    var newScore = state.score + offset;

    if (newScore < AppConst.scoreMin) newScore = AppConst.scoreMin;
    if (newScore > AppConst.scoreMax) newScore = AppConst.scoreMax;

    setScore(newScore);
  }

  void increaseScore() {
    modifyScore(1);
  }

  void decreaseScore() {
    modifyScore(-1);
  }

}

class GameStoreState {
  final int score;

  GameStoreState({this.score = 0});

  GameStoreState copyWith({int? score}) {
    return GameStoreState(
        score: score ?? this.score);
  }

  factory GameStoreState.init() {
    return GameStoreState(score: AppConst.scoreDefault);
  }
}
