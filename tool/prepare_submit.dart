import 'dart:io';

import 'generate_readme.dart' as generate_readme;

void main() async {
  generate_readme.main();
  await Process.run(Platform.executable, ['format', '.']);
}
