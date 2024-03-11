import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';
import 'package:screenshot_testing/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScreenshotController screenshotController = ScreenshotController();

  void _incrementCounter() async {
    Uint8List? list = await screenshotController.capture();
    if (list != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultView(list: list)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Screenshot(
        controller: screenshotController,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset('assets/images/1.jpg',
                  fit: BoxFit.fill, height: MediaQuery.sizeOf(context).height),
            ),
            Expanded(
                child: Image.asset(
              'assets/images/2.jpg',
              fit: BoxFit.fill,
              height: MediaQuery.sizeOf(context).height,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
