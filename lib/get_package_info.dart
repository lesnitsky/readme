import 'dart:io';

import 'package:yaml/yaml.dart' as yaml;
import 'package:fs_extensions/fs_extensions.dart';

class PackageInfo {
  String name;
  String description;
  String version;
  bool isCLI;
}

PackageInfo getPackageInfo() {
  final pubspecFile = File(Directory.current.path.joinAll(['pubspec.yaml']));
  final pubspec = yaml.loadYaml(pubspecFile.maybeReadAsStringSync());

  return PackageInfo()
    ..name = pubspec['name']
    ..description = pubspec['description']
    ..version = pubspec['version']
    ..isCLI = Directory(Directory.current.path.joinAll(['bin'])).existsSync();
}
