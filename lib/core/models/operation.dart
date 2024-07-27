import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Operation {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final bool income;
  @HiveField(3)
  final int amount;
  @HiveField(4)
  final int iconID;

  Operation({
    required this.id,
    required this.name,
    required this.income,
    required this.amount,
    required this.iconID,
  });
}

class OperationAdapter extends TypeAdapter<Operation> {
  @override
  final typeId = 0;

  @override
  Operation read(BinaryReader reader) {
    return Operation(
      id: reader.read(),
      name: reader.read(),
      income: reader.read(),
      amount: reader.read(),
      iconID: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Operation obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.income);
    writer.write(obj.amount);
    writer.write(obj.iconID);
  }
}

List<Operation> operationsTestList = [
  Operation(
    id: 1,
    name: 'Aaa',
    income: true,
    amount: 100,
    iconID: 1,
  ),
  Operation(
    id: 2,
    name: 'Bbb',
    income: false,
    amount: 80,
    iconID: 2,
  ),
  Operation(
    id: 3,
    name: 'Ccc',
    income: false,
    amount: 20,
    iconID: 3,
  ),
  Operation(
    id: 4,
    name: 'Ddd',
    income: true,
    amount: 10,
    iconID: 4,
  ),
  Operation(
    id: 5,
    name: 'Eee',
    income: false,
    amount: 50,
    iconID: 5,
  ),
];
