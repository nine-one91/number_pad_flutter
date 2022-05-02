# NumberPad

easy to use number pad library for Flutter

 [![Flutter](https://img.shields.io/badge/Platform-Flutter-blue.svg)](https://flutter.dev/)

## GIF
![NumberPadDemo](https://github.com/nine-one91/number_pad_flutter/blob/main/content.gif)

## 💻 Installation

You just need to add `number_pad` as a [dependency in your pubspec.yaml file.](https://flutter.dev/docs/development/packages-and-plugins/using-packages)

```yaml
dependencies:
number_pad: ^1.0.0
```

## Usage

### Import this class

```dart
import 'package:number_pad/number_pad.dart';
```

## NumberPadWidget

```dart
@override
Widget build(BuildContext context) {
  NumberPad.shuffle();
  // TODO: implement build
  return Scaffold(
    body:NumberPad(
      onChange: (String value){},
      icon: Icon(Icons.arrow_back_ios_rounded),
      textStyle: TextStyle(),
      backgroundColor: Colors.red,
      borderColor: Colors.blue,
    )
  );
}
```


## 📃License

    Copyright (c) 2022 nine-one91

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.