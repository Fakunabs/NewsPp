import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_1/models/article.dart';
import 'package:bloc_1/data/repository/news_repository.dart';
import 'package:equatable/equatable.dart';
part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  // truyen vao trang thai ban dau InitialState cho Bloc
  ArticleBloc() : super(const ArticleState()) {
    on<GetDataEvent>(_getDataEvent);
    on<RefreshDataEvent>(_refreshDataEvent);
    on<CategorizeByCountryEvent>(_categorizeDateByCountry);
    add(GetDataEvent());
  }
  // event handler
  Future<void> _getDataEvent(
      GetDataEvent event, Emitter<ArticleState> emit) async {
    try {
      // emit takes the stream and return new state when the stream is updated
      // kiem tra state co thay doi ko
      emit(state.copyWith(isLoading: true));
      final value = await NewsRepository().getArticles();
      emit(state.copyWith(article: value, isLoading: false));
    } catch (exception) {
      emit(state.copyWith(isLoading: false, error: exception.toString()));
    }
  }

  Future<void> _refreshDataEvent(
      RefreshDataEvent event, Emitter<ArticleState> emit) async {
    try {
      // emit takes the stream and return new state when the stream is updated
      emit(state.copyWith(isLoading: true));
      final value = await NewsRepository().getArticles();
      emit(state.copyWith(article: value, isLoading: false));
    } catch (exception) {
      emit(state.copyWith(isLoading: false, error: exception.toString()));
    }
  }

  Future<void> _categorizeDateByCountry(
      CategorizeByCountryEvent event, Emitter<ArticleState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final value = await NewsRepository().getArticles(country: event.country);
      emit(state.copyWith(article: value, isLoading: false));
    } catch (exception) {
      emit(state.copyWith(isLoading: false, error: exception.toString()));
    }
  }
}
