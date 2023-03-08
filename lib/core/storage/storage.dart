import 'package:get_storage/get_storage.dart';

class StorageManager {
  static final StorageManager _instance = StorageManager._init();

  GetStorage? box;
  static StorageManager get instance => _instance;

  StorageManager._init() {
    box = GetStorage();
    var lat = GetStorage().read(LAST_LAT);
    var long = GetStorage().read(LAST_LONG);
    if (lat == null || long == null) {
      setData(LAST_LAT, '41.0151');
      setData(LAST_LONG, '28.9795');
    }
  }

  static String LAST_LONG = 'last_long';
  static String LAST_LAT = 'last_lat';

  void setData(String key, dynamic value) => GetStorage().write(key, value);

  int? getInt(String key) => GetStorage().read(key);

  String? getString(String key) => GetStorage().read(key);

  bool? getBool(String key) => GetStorage().read(key);

  double? getDouble(String key) => GetStorage().read(key);

  dynamic getData(String key) => GetStorage().read(key);

  void clearData() async => GetStorage().erase();
}
