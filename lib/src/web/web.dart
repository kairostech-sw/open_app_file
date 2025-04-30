import 'package:web/web.dart' as web;

void open(String uri, String filename) {
  final anchor = web.HTMLAnchorElement()
    ..href = uri
    ..setAttribute('download', filename)
    ..setAttribute('target', '_blank');
  anchor.click();
}
