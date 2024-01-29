import 'package:bloc_1/models/article.dart';
import 'package:flutter/material.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;

  const ArticleDetail({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title ?? '')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            const SizedBox(height: 16),
            _buildImage(),
            const SizedBox(height: 16),
            _buildContent(),
            const SizedBox(height: 16),
            _buildAuthorInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      article.title ?? '',
      style: const TextStyle(
        color: Colors.black,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildImage() {
    return Image.network(
      article.urlToImage ??
          'https://avatars.githubusercontent.com/u/114759170?v=4',
      fit: BoxFit.cover,
      height: 200,
    );
  }

  Widget _buildContent() {
    return Text(
      article.content ?? '',
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _buildAuthorInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Author: ${article.author ?? 'Unknown'}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Published at: ${article.publishedAt ?? 'Unknown'}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
