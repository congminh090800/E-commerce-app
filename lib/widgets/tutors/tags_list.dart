import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tags/flutter_tags.dart';

class TagsList extends StatefulWidget {
  const TagsList({Key? key, required this.tagsList, this.readOnly = false})
      : super(key: key);
  final List<String> tagsList;
  final bool readOnly;
  @override
  _TagsListState createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Tags(
        key: _tagStateKey,
        itemCount: widget.tagsList.length,
        alignment: WrapAlignment.start,
        symmetry: false,
        itemBuilder: (index) {
          final item = widget.tagsList[index];
          return ItemTags(
            key: Key(index.toString()),
            index: index,
            title: item,
            pressEnabled: true,
            active: index == 0 && widget.readOnly == false ? true : false,
            color: Color(0xffe4e6eb),
            textColor: Color(0xff646464),
            onPressed: (item) => print(item),
          );
        },
      ),
    );
  }
}
