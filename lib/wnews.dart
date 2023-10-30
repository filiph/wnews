import 'dart:convert';

import 'package:xpath_selector/xpath_selector.dart';
import 'package:html/parser.dart' as html;

/// Parses the JSON response from
/// https://api.wikimedia.org/feed/v1/wikipedia/en/featured/2023/10/30
/// where date is current day and language is parameter
/// and extracts news items.
///
/// For each item uses story and links parameters
List<NewsItem> extractNews(String json) {
  final parsedJson = jsonDecode(json) as Map<String, dynamic>;
  final news = parsedJson['news'] as List<dynamic>?;

  if (news == null || news.isEmpty) {
    throw StateError('The list is empty');
  }

  final newsList = news.map((n) {
    final currentNew = n['story'];

    // Parse the HTML content within the "story" field
    final document = html.parse(currentNew);

    // Extract the text content from the parsed HTML
    final newsContent = document.body!.text;

    // Extract url from json
    final links = n['links'] as List<dynamic>?;
    Uri? uri;
    if (links != null && links.isNotEmpty) {
      final url = links.first['content_urls']['desktop']['page'] as String?;
      if (url != null) uri = Uri.tryParse(url);
    }

    return NewsItem(newsContent, uri);
  }).toList(growable: false);

  return newsList;
}

NewsItem extract(XPathNode node) {
  final text = node.text!.replaceAll(' (pictured)', '');
  final linkElement = node.queryXPath('//b//a').node;
  Uri? link;
  if (linkElement != null) {
    link = Uri.tryParse(linkElement.attributes['href'] ?? '');
  }
  return NewsItem(text, link);
}

/// This represents a single item of news as seen on Wikipedia's
/// main page.
class NewsItem {
  /// The text of the news item.
  ///
  /// Example:
  ///
  /// > The wreckage of the Montevideo Maru is discovered
  /// > in the South China Sea.
  final String text;

  /// The link associated with the news item.
  ///
  /// Example:
  ///
  ///     https://en.wikipedia.org/wiki/Montevideo_Maru
  final Uri? link;

  // Constructs a news item with [text] and (optional) [link].
  const NewsItem(this.text, this.link);
}
