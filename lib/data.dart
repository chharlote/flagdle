import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

part 'data.g.dart';

@collection
class UserData {
  Id id = Isar.autoIncrement;
  late String pseudo;
  late int score;
}

class DataManager {
  late Future<Isar> db;

  DataManager() {
    db = _initDB();
  }

  Future<Isar> _initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open([UserDataSchema], directory: dir.path);
  }

  Future<void> writeData(String pseudo, int score) async {
    final isar = await db;
    final userData = UserData()
      ..pseudo = pseudo
      ..score = score;

    await isar.writeTxn(() async {
      await isar.userDatas.put(userData);
    });
  }

  Future<UserData?> readData() async {
    final isar = await db;
    return await isar.userDatas.where().findFirst();
  }
}
