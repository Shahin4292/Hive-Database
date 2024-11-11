import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDatabase extends StatefulWidget {
  const HiveDatabase({super.key});

  @override
  State<HiveDatabase> createState() => _HiveDatabaseState();
}

class _HiveDatabaseState extends State<HiveDatabase> {
  var dataStorageBox = Hive.box("MyBox");

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void addOrUpdate({String? key}) {
    if (key != null) {
      final person = dataStorageBox.get(key);
      if (person != null) {
        _nameController.text = person["name"] ?? "";
        _ageController.text = person["age"]?.toString() ?? "";
      }
    } else {
      _nameController.clear();
      _ageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[50],
        title: const Text("Hive Database"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
