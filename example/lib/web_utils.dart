import 'dart:js_interop';
import 'dart:typed_data';
import 'dart:convert';
import 'package:web/web.dart' as web;

@JS('URL.createObjectURL')
external String createObjectURL(web.Blob blob);

@JS('URL.revokeObjectURL')
external void revokeObjectURL(String url);

/// Creates a downloadable text file from the given string data.
///
/// [data] The text content to be included in the file.
/// Returns a URL that can be used to download the file.
///
/// Note: The caller is responsible for revoking the URL when it's no longer needed
/// by calling [revokeObjectURL].
Future<String> createTextFile(String data) async {
  try {
    final bytes = Uint8List.fromList(utf8.encode(data));
    final blob = web.Blob(
      [bytes.toJS] as JSArray<web.BlobPart>,
      web.BlobPropertyBag(type: 'text/plain;charset=utf-8'),
    );
    final url = createObjectURL(blob);
    if (url.isEmpty) {
      throw Exception('Failed to create object URL');
    }
    return url;
  } catch (e) {
    throw Exception('Failed to create text file: $e');
  }
}
