import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tags/flutter_tags.dart';

class TagsList extends StatefulWidget {
  const TagsList(
      {Key? key,
      required this.tagsList,
      this.selectFirstItem = false,
      this.isHorizontal = false})
      : super(key: key);
  final List<String> tagsList;
  final bool selectFirstItem;
  final bool isHorizontal;
  @override
  _TagsListState createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:
          widget.isHorizontal == true ? Axis.horizontal : Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Tags(
          key: _tagStateKey,
          itemCount: widget.tagsList.length,
          alignment: WrapAlignment.start,
          itemBuilder: (index) {
            final item = widget.tagsList[index];
            return ItemTags(
              key: Key(index.toString()),
              index: index,
              title: item,
              pressEnabled: true,
              active:
                  index == 0 && widget.selectFirstItem == true ? true : false,
              color: Color(0xffe4e6eb),
              textColor: Color(0xff646464),
              onPressed: (item) => print(item),
            );
          },
        ),
      ),
    );
  }
}
