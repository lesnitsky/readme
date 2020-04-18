import 'dart:io';

import 'package:fs_extensions/fs_extensions.dart';

Future<String> getExample() async {
  final dir = Directory.current;
  final dartExample = File(dir.path.joinAll(['example', 'lib', 'main.dart']));
  final example = File(dir.path.joinAll(['example', 'README.md']));

  if (!dartExample.existsSync() && !example.existsSync()) {
    return null;
  }

  return '''```dart
${dartExample.readAsStringSync()}
```

${example.maybeReadAsStringSync()}''';
}
