import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith("/test")) {
    dir = dir.replaceAll("/test", "");
  }

  return File('$dir/test/features/product/helpers/dummy_data/$name')
      .readAsStringSync();
}
