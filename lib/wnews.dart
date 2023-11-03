import 'dart:convert';

import 'package:html/parser.dart' as html;
import 'package:intl/intl.dart';

/// Parses the JSON response from URLs such as
/// `https://api.wikimedia.org/feed/v1/wikipedia/en/featured/2023/10/30`.
/// and extracts news items.
///
/// For each item, this method uses story and links parameters
/// to extract [NewsItem].
///
/// Structure of url defined at https://api.wikimedia.org/wiki/Feed_API/Reference/Featured_content.
/// You can get the URL for the current news with [getEndpointUri].
List<NewsItem> extractNews(String json) {
  if (json.trim().isEmpty) {
    throw ArgumentError('Cannot extract news from empty string');
  }

  final parsedJson = jsonDecode(json) as Map<String, dynamic>;
  final news = parsedJson['news'] as List<dynamic>?;

  if (news == null || news.isEmpty) {
    throw StateError('The list is empty');
  }

  var newsList = <NewsItem>[];

  for (final n in news) {
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
    newsList.add(NewsItem(newsContent, uri));
  }

  return newsList;
}

/// Returns the URI at which the Wikimedia API returns the current news,
/// such as
/// `https://api.wikimedia.org/feed/v1/wikipedia/en/featured/2023/10/30`.
Uri getEndpointUri({String language = 'en'}) {
  final now = DateTime.now();
  final today = DateFormat('yyyy/MM/dd').format(now);

  return Uri.parse(
      'https://api.wikimedia.org/feed/v1/wikipedia/$language/featured/$today');
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
