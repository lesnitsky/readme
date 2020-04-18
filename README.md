# readme

[![lesnitsky.dev](https://lesnitsky.dev/shield.svg?hash=121822)](https://lesnitsky.dev?utm_source=readme)
[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/readme.svg?style=social)](https://github.com/lesnitsky/readme)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)

Generates a readme for flutter package

## Installation

pubspec.yaml:

```yaml
dependencies:
  readme: ^1.0.0
```

or

```sh
pub global activate readme
```

## Example

```dart
import 'dart:io';

import 'package:readme/readme.dart';

void main(List<String> args) async {
  final info = getPackageInfo();

  final shiledProps = await ShieldProps.read();

  final readme = new Readme()
    ..packageName = info.name
    ..description = info.description
    ..license = args.length > 0 ? args.first : 'MIT'
    ..example = await getExample()
    ..shields = compileShields(shiledProps);

  stdout.write(readme);
}

```

From command line

```sh
readme <LICENSE_TYPE> # default: MIT
```

## License

MIT
