import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:tipitaka_pali/business_logic/models/search_result.dart';

class SearchResultListTile extends StatelessWidget {
  final SearchResult result;
  final String textToHighlight;

  const SearchResultListTile({Key? key, required this.result, required this.textToHighlight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${result.book.name} (page - ${result.pageNumber})',
              textAlign: TextAlign.right,
              style:
                  TextStyle(fontSize: 16, color: Theme.of(context).primaryColor, ),
            ),
            SubstringHighlight(
              text: result.description,
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).textTheme.bodyText2?.color),
              term: textToHighlight,
              textStyleHighlight:
                  TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
