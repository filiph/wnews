import 'package:xpath_selector/xpath_selector.dart';
import 'package:xpath_selector_html_parser/xpath_selector_html_parser.dart';

/// Takes the HTML contents of something like
/// https://en.wikipedia.org/wiki/Main_Page
/// and extracts the items in the _In the news_ section.
///
/// For the sake of simplicity, this currently only works for the English
/// Wikipedia, and assumes quite a lot about the structure
/// of the page.
List<NewsItem> extractNews(String html) {
  final parser = HtmlXPath.html(html);

  final newsHeadline =
      parser.query("//h2[contains(text(),'In the news')]").node;
  if (newsHeadline == null) {
    throw ArgumentError('Cannot find the headline "In the news"');
  }

  final boxDiv = newsHeadline.queryXPath('/ancestor::div').node;
  if (boxDiv == null) {
    throw StateError('Cannot find the ancestor <div> of "In the news"');
  }

  final firstList = boxDiv.queryXPath("/descendant::ul[1]").node;
  if (firstList == null) {
    throw StateError('Cannot find the first list of news');
  }

  final listItems = firstList.queryXPath('/li').nodes;
  if (listItems.isEmpty) {
    throw StateError('The list is empty');
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

  return listItems.map((li) => extract(li)).toList(growable: false);
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
