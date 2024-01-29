import 'package:bloc_1/presentation/widgets/article_detail.dart';
import 'package:bloc_1/presentation/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../models/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;

  const ArticleItem({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildArticleImage(),
          const SizedBox(width: 16),
          Expanded(
            child: _buildArticleDetails(context),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleImage() {
    return SizedBox(
      height: 130,
      width: 130,
      child: Image.network(
        article.urlToImage ?? Constant.urlImage,
        fit: BoxFit.cover,
        errorBuilder: onError,
      ),
    );
  }

  Widget _buildArticleDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        _buildContent(),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ArticleDetail(article: article),
        ));
      },
      child: Text(
        article.title ?? '',
        maxLines: 2,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Text(
      article.content ?? '',
      maxLines: 2,
    );
  }

  Widget onError(BuildContext context, Object error, StackTrace? stackTrace) {
    return Image.network(Constant.urlImage);
  }
}
