import 'package:flutter/material.dart';

class DangerPage extends StatefulWidget {
  const DangerPage({super.key});

  @override
  State<StatefulWidget> createState() => _DangerPage();
}

class _DangerPage extends State<DangerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("위험"),
      ),
      body: const Text("위험"),
    );
  }
}