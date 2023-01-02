import 'dart:convert';
import 'dart:io';

import 'package:wnews/wnews.dart';

void main(List<String> arguments) async {
  final client = HttpClient();
  final request = await client.getUrl(Uri.parse(
      'https://en.m.wikipedia.org/wiki/Main_Page'));
  final response = await request.close();
  final html = await utf8.decodeStream(response);

  final news = extractNews(html);

  for (final item in news) {
    print(item.text);
    if (item.link != null) {
      final url = Uri.parse('https://en.wikipedia.org/').resolveUri(item.link!);
      // print('→ $url');
      print('');
    }
  }

  client.close(force: true);
}
