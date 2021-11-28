import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tags/flutter_tags.dart';

class TagsList extends StatefulWidget {
  const TagsList(
      {Key? key,
      required this.tagsList,
      this.selectFirstItem = false,
      this.isHorizontal = false,
      this.readOnly = false,
      this.onSelectedList,
      this.defaultSelected})
      : super(key: key);
  final List<String> tagsList;
  final bool selectFirstItem;
  final bool isHorizontal;
  final bool readOnly;
  final Function(List<String>)? onSelectedList;
  final List<String>? defaultSelected;
  @override
  _TagsListState createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  List<String> selectedList = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedList = widget.defaultSelected ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:
          widget.isHorizontal == true ? Axis.horizontal : Axis.vertical,
      child: Container(
        child: Tags(
          key: _tagStateKey,
          itemCount: widget.tagsList.length,
          alignment: WrapAlignment.start,
          itemBuilder: (index) {
            final item = widget.tagsList[index];
            return ItemTags(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              textStyle: TextStyle(
                fontSize: 16,
              ),
              textActiveColor: Color.fromRGBO(0, 113, 240, 1),
              activeColor: Color.fromRGBO(221, 234, 255, 1),
              elevation: 0,
              border: Border.all(
                width: 0,
                color: Colors.transparent,
              ),
              key: Key(index.toString()),
              index: index,
              title: item,
              pressEnabled: widget.readOnly == true ? false : true,
              active: (index == 0 && widget.selectFirstItem == true) ||
                      widget.readOnly == true ||
                      selectedList.contains(item)
                  ? true
                  : false,
              color: Color(0xffe4e6eb),
              textColor: Color(0xff646464),
              onPressed: widget.readOnly
                  ? null
                  : (item) {
                      setState(() {
                        if (selectedList.contains(item.title)) {
                          selectedList.remove(item.title);
                        } else {
                          selectedList.add(item.title);
                        }
                      });
                      widget.onSelectedList!(selectedList);
                    },
            );
          },
        ),
      ),
    );
  }
}
