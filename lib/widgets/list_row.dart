
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/txt.dart';

import '../model/albums_list.dart';

class ListRow extends StatelessWidget {
  //
  final Album album;
  const ListRow({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt(text: album.title),
          const Divider(),
        ],
      ),
    );
  }
}
