import 'dart:typed_data';

import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final Uint8List list;

  const ResultView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ScreenShot Result',
        ),
        centerTitle: true,
      ),
      body: Image.memory(list),
    );
  }
}
