

String jsonLiteralAsDart(dynamic value) {
  if (value == null) return 'null';

  if (value is String) return escapeDartString(value);

  if (value is bool || value is num) return value.toString();

  if (value is List) {
    final listItems = value.map(jsonLiteralAsDart).join(',');
    return '[$listItems]';
  }

  if (value is Map) return jsonMapAsDart(value);

  throw StateError(
      'Should never get here – with ${value.runtimeType} - `$value`.');
}

String jsonMapAsDart(Map value) {
  final buffer = StringBuffer();
  buffer.write('{');

  var first = true;

  value.forEach((k, v) {
    if (first) {
      first = false;
    } else {
      buffer.write(',');
    }
    buffer.write(escapeDartString(k as String));
    buffer.write(':');
    buffer.write(jsonLiteralAsDart(v));
  });

  buffer.write('}');

  return buffer.toString();
}

String escapeDartString(String value) {
  return '"' + value + '"';
}