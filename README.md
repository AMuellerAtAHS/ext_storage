# ext_storage

This project is forked from https://github.com/yasukotelin/ext_storage, cause the author didn't update since 2020.

ext_storage is minimal flutter plugin that provides external storage path and external public storage path.

## Features

> **NOTE** This plugin only supports Android.

ext_storage package calls Android native code, `Environment.getExternalStorageDirectory()` and `Environment.getExternalStoragePublicDirectory()`.

| ext_storage                                     | Andorid Native                                  |
|------------------------------------------------|-------------------------------------------------|
| ext_storage.getExternalStorageDirectory()       | Environment.getExternalStorageDirectory()       |
| ext_storage.getExternalStoragePublicDirectory() | Environment.getExternalStoragePublicDirectory() |

`ext_storage.getExternalStoragePublicDirectory()` needs Public Directory Type argument same as native `Environment.getExternalStoragePublicDirectory()`.

| ExtStorage                         | Android Native                      |
|------------------------------------|-------------------------------------|
| ExtStorage.DIRECTORY_MUSIC         | Environment.DIRECTORY_MUSIC         |
| ExtStorage.DIRECTORY_PODCASTS      | Environment.DIRECTORY_PODCASTS      |
| ExtStorage.DIRECTORY_RINGTONES     | Environment.DIRECTORY_RINGTONES     |
| ExtStorage.DIRECTORY_ALARMS        | Environment.DIRECTORY_ALARMS        |
| ExtStorage.DIRECTORY_NOTIFICATIONS | Environment.DIRECTORY_NOTIFICATIONS |
| ExtStorage.DIRECTORY_PICTURES      | Environment.DIRECTORY_PICTURES      |
| ExtStorage.DIRECTORY_MOVIES        | Environment.DIRECTORY_MOVIES        |
| ExtStorage.DIRECTORY_DOWNLOADS     | Environment.DIRECTORY_DOWNLOADS     |
| ExtStorage.DIRECTORY_DCIM          | Environment.DIRECTORY_DCIM          |
| ExtStorage.DIRECTORY_DOCUMENTS     | Environment.DIRECTORY_DOCUMENTS     |
| ExtStorage.DIRECTORY_SCREENSHOTS   | Environment.DIRECTORY_SCREENSHOTS   |
| ExtStorage.DIRECTORY_AUDIOBOOKS    | Environment.DIRECTORY_AUDIOBOOKS    |

## Installation

Add `ext_storage` as a dependency in your project `pubspec.yaml`.

```yaml
dependencies:
  ext_storage: #^2.0.0 # !!! replace with actual package version
    git: https://github.com/AMuellerAtAHS/ext_storage.git
```

and run the `flutter pub get` to install.

## Usage

First, you write import `ext_storage` package.

```dart
import 'package:ext_storage/ext_storage.dart';
```

And then you can call two functions.

```dart
void _example1() async {
  var path = await ExtStorage.getExternalStorageDirectory();
  print(path);  // /storage/emulated/0
}

void _example2() async {
  var path = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DOWNLOADS);
  print(path);  // /storage/emulated/0/Downloads
}
```

## Author

AMuellerAtAHS

## Fork

Fork of: https://github.com/yasukotelin/ext_storage

## LICENCE

MIT LICENCE