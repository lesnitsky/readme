import 'dart:io';

import 'package:readme/readme.dart';
import 'package:readme/get_example.dart';
import 'package:readme/get_package_info.dart';
import 'package:shields/shields.dart';

void main(List<String> args) async {
  final info = getPackageInfo();

  final shiledProps = await ShieldProps.read(packageName: info.name);

  final readme = new Readme()
    ..packageName = info.name
    ..description = info.description
    ..packageVersion = info.version
    ..isCLI = info.isCLI
    ..license = args.length > 0 ? args.first : 'MIT'
    ..example = await getExample()
    ..shields = compileShields(shiledProps);

  stdout.write(readme.compile());
}
