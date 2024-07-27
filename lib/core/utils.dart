import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/my_model.dart';

String firstName = 'User';
String lastName = '';
String imagePath = '';

// SHARED PREFS
Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  firstName = prefs.getString('firstName') ?? 'User';
  lastName = prefs.getString('lastName') ?? '';
  imagePath = prefs.getString('imagePath') ?? '';
}

Future<void> saveName(String firstName, String lastName) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('firstName', firstName);
  prefs.setString('lastName', lastName);
}

Future<void> saveImage(String path) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('imagePath', path);
  imagePath = path;
}

// HIVE
List<MyModel> mymodels = [];

Future<List<MyModel>> getModels() async {
  final box = await Hive.openBox('mymodelbox');
  List data = box.get('mymodels') ?? [];
  mymodels = data.cast<MyModel>();
  log(mymodels.length.toString());
  return mymodels;
}

Future<List<MyModel>> updateModels() async {
  final box = await Hive.openBox('mymodelbox');
  box.put('mymodels', mymodels);
  mymodels = await box.get('mymodels');
  return mymodels;
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

Future<XFile> pickImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return XFile('');
    return image;
  } catch (e) {
    print(e);
    return XFile('');
  }
}
