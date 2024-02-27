
import 'package:flutter/material.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/model.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${post.id}', style: textTheme.bodySmall),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
        dense: true,
      ),
    );
  }
}