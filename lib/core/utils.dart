import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/operation.dart';

String firstName = 'User';
String lastName = '';
String imagePath = '';
int myIncomes = 0;
int myExpenses = 0;

// SHARED PREFS
Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  firstName = prefs.getString('firstName') ?? 'User';
  lastName = prefs.getString('lastName') ?? '';
  imagePath = prefs.getString('imagePath') ?? '';
  myIncomes = prefs.getInt('myIncomes') ?? 0;
  myExpenses = prefs.getInt('myExpenses') ?? 0;
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

Future<void> saveMoney(int amount, bool income) async {
  final prefs = await SharedPreferences.getInstance();
  if (income) {
    prefs.setInt('myIncomes', amount);
  } else {
    prefs.setInt('myExpenses', amount);
  }
}

// HIVE
List<Operation> operationsList = [];

Future<List<Operation>> getModels() async {
  final box = await Hive.openBox('operationbox');
  List data = box.get('operationsList') ?? [];
  operationsList = data.cast<Operation>();
  log(operationsList.length.toString());
  return operationsList;
}

Future<List<Operation>> updateModels() async {
  final box = await Hive.openBox('operationbox');
  box.put('operationsList', operationsList);
  operationsList = await box.get('operationsList');
  return operationsList;
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

List<Operation> getList(int index) {
  print('GET LIST');
  List<Operation> incomes = [];
  List<Operation> expenses = [];
  if (index == 0) return operationsTestList;
  if (index == 1) {
    for (Operation operation in operationsTestList) {
      if (operation.income) incomes.add(operation);
    }
    return incomes;
  }
  if (index == 2) {
    for (Operation operation in operationsTestList) {
      if (!operation.income) expenses.add(operation);
    }
    return expenses;
  }
  return [];
}
