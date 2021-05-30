// import 'package:flutter/widgets.dart';
//
// class MySearchBar extends StatefulWidget {
//   const MySearchBar({Key? key, required this.items}) : super(key: key);
//
//   final List items;
//
//   @override
//   _MySearchBarState createState() => _MySearchBarState();
// }
//
// class _MySearchBarState extends State<MySearchBar> {
//   static const historyLength = 5;
//
// // The "raw" history that we don't access from the UI, prefilled with values
//   List<String> _searchHistory = [
//     'fuchsia',
//     'flutter',
//     'widgets',
//     'resocoder',
//   ];
//
//   List<String> filterSearchTerms({required String? filter}) {
//     if (filter!.isNotEmpty) {
//       // Reversed because we want the last added items to appear first in the UI
//       return _searchHistory.reversed.where((term) => term.startsWith(filter)).toList();
//     } else {
//       return _searchHistory.reversed.toList();
//     }
//   }
//   @override
//   void initState() {
//     super.initState();
//     filteredSearchHistory = filterSearchTerms(filter: null);
//   }
//
//   void addSearchTerm(String term) {
//     if (_searchHistory.contains(term)) {
//       // This method will be implemented soon
//       putSearchTermFirst(term);
//       return;
//     }
//     _searchHistory.add(term);
//     if (_searchHistory.length > historyLength) {
//       _searchHistory.removeRange(0, _searchHistory.length - historyLength);
//     }
//     // Changes in _searchHistory mean that we have to update the filteredSearchHistory
//     filteredSearchHistory = filterSearchTerms(filter: null);
//   }
//   void putSearchTermFirst(String term) {
//     deleteSearchTerm(term);
//     addSearchTerm(term);
//   }
//
//   void deleteSearchTerm(String term) {
//     _searchHistory.removeWhere((t) => t == term);
//     filteredSearchHistory = filterSearchTerms(filter: null);
//   }
//
// // The filtered & ordered history that's accessed from the UI
//   late List<String> filteredSearchHistory;
//
// // The currently searched-for term
//   late String selectedTerm;
//
//   @override
//   Widget build(BuildContext context) {
//     return FloatingSearchBar(
//         body: SearchResultsListView(
//         searchTerm: selectedTerm,
//     )
//   }
// }
