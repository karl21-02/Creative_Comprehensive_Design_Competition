import 'package:flutter/material.dart';

class FamilyManagePage extends StatefulWidget {
  const FamilyManagePage({super.key});

  @override
  State<StatefulWidget> createState() => _FamilyManagePage();
}

class _FamilyManagePage extends State<FamilyManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("가족"),
      ),
      body: const Text("가족"),
    );
  }

}