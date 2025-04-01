import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamExample(),
    );
  }
}

class StreamExample extends StatefulWidget {
  @override
  _StreamExampleState createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  final StreamController<int> _streamController = StreamController<int>();
  Stream<int>? _stream;
  Timer? _timer;
  int _counter = 0;
  bool _isStreaming = false;

  @override
  void initState() {
    super.initState();
    _stream = _streamController.stream;
  }

  void _startStream() {
    if (_isStreaming) return;

    _isStreaming = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _streamController.sink.add(_counter);
      _counter++;
    });
  }

  void _stopStream() {
    _timer?.cancel();
    _isStreaming = false;
  }

  @override
  void dispose() {
    _streamController.close();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stream Example")),
      body: Center(
        child: StreamBuilder<int>(
          stream: _stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Waiting for data...");
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return Text(
                "Counter: ${snapshot.data}",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              );
            } else {
              return Text("No Data");
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _startStream,
            child: Icon(Icons.play_arrow),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: _stopStream,
            child: Icon(Icons.stop),
          ),
        ],
      ),
    );
  }
}