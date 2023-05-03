import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:wnews/wnews.dart';

void main(List<String> arguments) async {
  var parser = ArgParser(usageLineLength: 80);

  parser.addFlag(
    'links',
    abbr: 'l',
    help: 'Show links after each news item.',
    defaultsTo: true,
  );

  parser.addFlag(
    'help',
    abbr: '?',
    help: 'Show this help.',
    negatable: false,
  );

  parser.addOption(
    'width',
    abbr: 'w',
    help: 'Width of terminal, in characters.',
    defaultsTo: '80',
  );

  var results = parser.parse(arguments);

  final showLinks = results['links']! as bool;
  final width = int.tryParse(results['width']!) ?? 80;

  if (results['help']) {
    print('Print the most important news of the past few days\n'
        'as compiled by Wikipedia editors.\n\n'
        'Usage:');
    print(parser.usage);
    exit(0);
  }

  final client = HttpClient();
  final request = await client
      .getUrl(Uri.parse('https://en.m.wikipedia.org/wiki/Main_Page'));
  final response = await request.close();
  final html = await utf8.decodeStream(response);

  final news = extractNews(html);

  for (final item in news) {
    final string = _writeItem(item, width, showLinks);
    print(string);
  }

  client.close(force: true);
}

String _writeItem(NewsItem item, int width, bool showLinks,
    {int indent = 2, String bullet = '→'}) {
  final buf = StringBuffer();

  var column = 0;

  void write(String message, bool withBullet) {
    assert(!message.contains('\n'));
    assert(column == 0);
    if (withBullet) {
      buf.write(bullet);
      buf.write(' ' * (indent - bullet.length));
    } else {
      buf.write(' ' * indent);
    }
    column += indent;
    final words = message.split(' ');
    var first = true;

    for (final word in words) {
      if (column + word.length > width) {
        buf.write('\n');
        buf.write(' ' * indent);
        buf.write(word);
        column = indent + word.length;
      } else {
        if (!first) buf.write(' ');
        buf.write(word);
        column += 1 + word.length;
      }
      first = false;
    }
    buf.writeln();
    column = 0;
  }

  write(item.text, true);
  if (item.link != null) {
    final url = Uri.parse('https://en.wikipedia.org/').resolveUri(item.link!);
    if (showLinks) {
      write('$url', false);
    }
  }

  return buf.toString();
}
