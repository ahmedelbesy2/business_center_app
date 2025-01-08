import 'package:art_core/widgets/search_view/search_model.dart';

abstract class SearchEvent {}

class InitEvent extends SearchEvent {
  final List<SearchModel> searchableList;

  InitEvent({required this.searchableList});
}

class OnSearchEvent extends SearchEvent {
  final String query;
  OnSearchEvent({required this.query});
}
