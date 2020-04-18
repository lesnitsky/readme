import 'package:tmpl/tmpl.dart';

export 'get_example.dart';
export 'get_package_info.dart';
export 'package:shields/shields.dart';

class Readme {
  String packageName;
  String packageVersion;
  String description;
  String license;
  String example;
  String shields;
  bool isCLI;

  bool get hasExample => example != null;
  bool get hasShields => shields != null;

  static String _template = r'''
# ${packageName}

${shields}

${description}

## Installation

pubspec.yaml:

```yaml
dependencies:
  ${packageName}: ^${packageVersion}
```

?((
or

```sh
pub global activate ${packageName}
```
)(isCLI))
## Example

${example}
## License

${license}
''';

  String compile() {
    final t = Template(_template);
    return t.compile({
      'packageName': packageName,
      'packageVersion': packageVersion,
      'description': description,
      'license': license,
      'hasExample': hasExample,
      'example': example,
      'hasShields': hasShields,
      'shields': shields,
      'isCLI': isCLI,
    });
  }
}
