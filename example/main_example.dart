import 'package:blurme/blurme.dart';
import 'package:flutter/material.dart';

import 'render_time_widget.dart';
import 'test_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Test widget'),
        ),
        body: Column(
          children: [
            const RenderTimeWidget(
              name: 'Stack+BackdropFilter',
              child: TestWidget(),
            ),
            const SizedBox(height: 100),
            RenderTimeWidget(
              name: 'Render Object',
              child: Blurme(blurriness: value, child: const TestWidget()),
            ),
            Slider(
              min: 0,
              max: 10,
              value: value,
              onChanged: (_value) {
                setState(() {
                  value = _value;
                });
              },
            ),
            Text(
              value.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ));
  }
}
