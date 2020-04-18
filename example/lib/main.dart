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
