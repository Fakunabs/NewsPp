// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'article_bloc.dart';

class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

// get data from data server
class GetDataEvent extends ArticleEvent {}

class RefreshDataEvent extends ArticleEvent {}

class CategorizeByCountryEvent extends ArticleEvent {
  final String country;
  const CategorizeByCountryEvent({required this.country});
}

class CategorizeByKeywordEvent extends ArticleEvent {
  final String? keyword;
  const CategorizeByKeywordEvent({
    this.keyword,
  });
}
