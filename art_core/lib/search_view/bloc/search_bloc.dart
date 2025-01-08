import 'package:art_core/art_core.dart';
import 'package:art_core/widgets/search_view/bloc/search_event.dart';
import 'package:art_core/widgets/search_view/search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, List<SearchModel>> {
  SearchBloc() : super([]) {
    on<InitEvent>(_init);
    on<OnSearchEvent>(_search);
  }

  static SearchBloc of(context) => BlocProvider.of(context);
  final List<SearchModel> searchableList = [];

  void _init(InitEvent event, Emitter<List<SearchModel>> emit) async {
    searchableList.addAll(event.searchableList);
    emit(searchableList);
  }

  _search(OnSearchEvent event, Emitter<List<SearchModel>> emit) {
    debugPrint(event.query);
    if (event.query.isEmpty) {
      emit(searchableList);
    } else {
      final results = searchableList.where((city) => city.val.toLowerCase().contains(event.query.toLowerCase())).toList();
      emit(results);
    }
  }
}
