import 'package:bloc_1/data/mapper/article_mapper.dart';
import 'package:bloc_1/data/datasource/news_service.dart';
import 'package:bloc_1/models/article.dart';

class NewsRepository {
  final newsService = NewsService();

  Future<List<Article>> getArticles({String country = 'us'}) async {
    final articlesReponse = await newsService.getArticles(country: country);
    return articlesReponse.map((e) {
      if (e.urlToImage != null &&
          e.urlToImage!.isNotEmpty &&
          e.urlToImage!.startsWith('//')) {
        return toArticle(e.copyWith(urlToImage: 'https:${e.urlToImage!}'));
      } else {
        return toArticle(e);
      }
    }).toList();
  }
}
