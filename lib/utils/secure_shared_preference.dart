import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageClass {
  final secretKey = "Your16CharacterK";

  performEncryption(String keyString, String plainText) {
    final key = Key.fromUtf8(keyString);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(keyString.substring(0, 16));
    Encrypted encryptedData = encrypter.encrypt(plainText, iv: initVector);
    return encryptedData.base64;
  }

  performDecryption(String keyString, encryptedData) {
    final key = Key.fromUtf8(keyString);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(keyString.substring(0, 16));
    return encrypter.decrypt64(encryptedData, iv: initVector);
  }

  /// save storage data
  Future<void> writeString({key, value}) async {
    final SharedPreferences secureStorage = await SharedPreferences.getInstance();
    await secureStorage.setString(key, performEncryption(secretKey, value));
  }

  Future<void> writeInt({key, value}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(key, performEncryption(secretKey, value));
  }

  Future<void> writeMap({key, value}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final jsonData = json.encode(value);
    await pref.setString(key, performEncryption(secretKey, jsonData));
  }

  Future<void> writeList({key, required List<dynamic> value}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String encodedValue = json.encode(value);
    await pref.setString(key, performEncryption(secretKey, encodedValue));
  }

  /// get storage data

  Future<String?> readString({key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var result = pref.getString(key);
    return result != null ? performDecryption(secretKey, result) : null;
    // return result;
  }

  Future<int?> readInt({key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var result = pref.getString(key);
    return result != null ? int.tryParse(performDecryption(secretKey, result)) : null;
  }

  Future<Map<String, dynamic>> readMap({required String key}) async {
    final SharedPreferences secureStorage = await SharedPreferences.getInstance();

    // Read the encoded string from secureStorage
    String? encodedValue = secureStorage.getString(key);

    // Check if the value is not null
    if (encodedValue != null) {
      // Decode the JSON string to a list
      Map<String, dynamic> decodedValue = json.decode(performDecryption(secretKey, encodedValue));
      return decodedValue;
    } else {
      // Handle the case where the value is null or not found
      return {};
    }
  }

  Future<List<dynamic>> readList({required String key}) async {
    final SharedPreferences secureStorage = await SharedPreferences.getInstance();

    // Read the encoded string from secureStorage
    String? encodedValue = secureStorage.getString(key);

    // Check if the value is not null
    if (encodedValue != null) {
      // Decode the JSON string to a list
      List<dynamic> decodedValue = json.decode(performDecryption(secretKey, encodedValue));
      return decodedValue;
    } else {
      // Handle the case where the value is null or not found
      return [];
    }
  }

  /// remove data
  Future<void> clearData({key}) async {
    final SharedPreferences secureStorage = await SharedPreferences.getInstance();
    await secureStorage.clear();
  }

  Future<void> deleteKey({key}) async {
    final SharedPreferences secureStorage = await SharedPreferences.getInstance();
    await secureStorage.remove(key);
  }
}

/*import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageClass {
  final secretKey = "Your16CharacterK";

  String performEncryption({required String keyString, required String plainText}) {
    final key = Key.fromUtf8(keyString);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(keyString.substring(0, 16));
    Encrypted encryptedData = encrypter.encrypt(plainText, iv: initVector);
    return encryptedData.base64;
  }

  String performDecryption({required String keyString, required String encryptedData}) {
    try {
      final key = Key.fromUtf8(keyString);
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      final initVector = IV.fromUtf8(keyString.substring(0, 16));
      return encrypter.decrypt64(encryptedData, iv: initVector);
    } catch (error) {
      print('Decryption failed: $error');
      return '';
    }
  }

  Future<void> writeString({required String key, required value}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString(key, performEncryption(keyString: secretKey, plainText: value));
  }

  Future<void> writeInt({required String key, required int value}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setInt(key, int.parse(performEncryption(keyString: secretKey, plainText: value.toString())));
  }

  Future<void> writeMap({required String key, required Map<String, dynamic> value}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    final jsonData = json.encode(value);
    await pref.setString(key, performEncryption(keyString: secretKey, plainText: jsonData));
  }

  Future<void> writeList({required String key, required List<dynamic> value}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    final encodedValue = json.encode(value);

    await pref.setString(key, performEncryption(keyString: secretKey, plainText: encodedValue));
  }

  Future<String?> readString({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    var result = await pref.getString(key);
    return result != null ? performDecryption(keyString: secretKey, encryptedData: result) : null;
  }

  Future<int?> readInt({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    var result = pref.getString(key);
    return result != null ? int.tryParse(performDecryption(keyString: secretKey, encryptedData: result)) : null;
  }

  Future<Map<String, dynamic>> readMap({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String? encodedValue = await pref.getString(key);
    return encodedValue != null ? json.decode(performDecryption(keyString: secretKey, encryptedData: encodedValue)) : {};
  }

  Future<List<dynamic>> readList({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String? encodedValue = performDecryption(keyString: secretKey,encryptedData: pref.getString(key) ?? "");


    print("encodedValueencodedValueencodedValueencodedValueencodedValueencodedValueencodedValueencodedValueencodedValue");
    print(encodedValue);
    print("encodedValueencodedValueencodedValueencodedValueencodedValueencodedValueencodedValueencodedValueencodedValue");

    return encodedValue != null ? json.decode(encodedValue) : [];
  }

  Future<void> clearData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  Future<void> deleteKey({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(key);
  }
}*/
