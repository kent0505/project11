import 'package:flutter/widgets.dart';

import '../../../core/models/operation.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class EditOperationPage extends StatefulWidget {
  const EditOperationPage({super.key, required this.operation});

  final Operation operation;

  @override
  State<EditOperationPage> createState() => _EditOperationPageState();
}

class _EditOperationPageState extends State<EditOperationPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          CustomAppbar('Change operation'),
        ],
      ),
    );
  }
}
