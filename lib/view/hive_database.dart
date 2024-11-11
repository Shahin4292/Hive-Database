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
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 15,
                right: 15,
                top: 15),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: "Enter name"),
                ),
                TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: "Enter name"),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Save"))
              ],
            ),
          );
        });
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
