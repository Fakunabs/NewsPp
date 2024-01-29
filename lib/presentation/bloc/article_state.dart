part of 'article_bloc.dart';

class ArticleState extends Equatable {
  final List<Article> article;
  final bool isLoading;
  final String error;

  const ArticleState({
    this.article = const <Article>[],
    this.isLoading = false,
    this.error = '',
  });

  ArticleState copyWith(
      {List<Article>? article,
      bool? isLoading,
      String? error,
      String? country}) {
    return ArticleState(
      article: article ?? this.article,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [article, isLoading, error];
}
