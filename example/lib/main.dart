import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:ext_storage/ext_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _externalStorageDirectory;
  String? _externalDownloadsDirectory;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String? externalStorageDirectory;
    String? externalDownloadsDirectory;

    try {
      externalStorageDirectory = await ExtStorage.getExternalStorageDirectory();
      externalDownloadsDirectory =
          await ExtStorage.getExternalStoragePublicDirectory(
              ExtStorage.DIRECTORY_DOWNLOADS);
    } on PlatformException {
      externalStorageDirectory = 'Only available for Android';
      externalDownloadsDirectory = 'Only available for Android';
    }

    if (!mounted) return;

    setState(() {
      _externalStorageDirectory = externalStorageDirectory!;
      _externalDownloadsDirectory = externalDownloadsDirectory!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('External Storage Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: _externalStorageDirectory != null &&
                    _externalDownloadsDirectory != null
                ? Column(
                    children: [
                      Text('ext_storage: $_externalStorageDirectory\n'),
                      Text('Downloads: $_externalDownloadsDirectory\n'),
                    ],
                  )
                : const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
