import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key key,
    @required this.document,
  }) : super(key: key);

  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(document['name'],
        style: TextStyle(
          decoration: document['returned'] ? TextDecoration.lineThrough : TextDecoration.none
        )
      ),
      subtitle: Text(document['person']['name'],
        style: TextStyle(
          decoration: document['returned'] ? TextDecoration.lineThrough : TextDecoration.none
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: (){},
    );
  }
}