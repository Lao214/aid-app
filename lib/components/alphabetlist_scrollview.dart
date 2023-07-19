import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

class CountryList extends ISuspensionBean {
  final String title;
  final String tag;
  CountryList(
    {
      required this.title,
      required this.tag
    }
  );

  @override
  String getSuspensionTag() => tag;
}

class AlphabetListScrollView extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onClickedItem;

  const AlphabetListScrollView({super.key,required this.items,required this.onClickedItem});

  @override
  State<AlphabetListScrollView> createState() => _AlphabetListScrollViewState();
}

class _AlphabetListScrollViewState extends State<AlphabetListScrollView> {
  List<CountryList> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initList(widget.items);
  }

  void initList(List<String> items) {
    this.items = items.map((item) => CountryList(title: item, tag: item[0].toUpperCase())).toList();

    SuspensionUtil.sortListBySuspensionTag(this.items);
    SuspensionUtil.setShowSuspensionStatus(this.items);

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) => AzListView(
    padding: EdgeInsets.all(7.0),
    data: items,
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];

      return _buildListItem(item);
    },
    indexHintBuilder: (context, hint) => Container(
      alignment: Alignment.center,
      width: 60,
      height: 60,
      decoration: BoxDecoration(color: Colors.teal,shape: BoxShape.circle),
      child: Text(
        hint,
        style: const TextStyle(color: Colors.white,fontSize: 24.0),
      ),
    ),
    // indexBarMargin: const EdgeInsets.all(10.0),
    indexBarOptions: const IndexBarOptions(
      needRebuild: true,
      selectTextStyle: TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
      selectItemDecoration: BoxDecoration(
        color: Colors.white,
      ),
      indexHintAlignment: Alignment.centerRight,
    ),
  );

  Widget _buildListItem(CountryList item) => ListTile(
    title:
      Container(
        margin: EdgeInsets.only(right: 16.0),
        child: ListTile(
          title: Text(item.title),
          onTap: () {
            widget.onClickedItem(item.title);
            // print('object');
          },
        ),
      )
  );

  // Widget _buildListItem(_AZItem item) {
  //   final tag = item.getSuspensionTag();
  //   final offstage = !item.isShowSuspension;
  //
  //   return Column(
  //     children: <Widget>[
  //       Offstage(offstage: offstage,child: buildHeader(tag),),
  //       Container(
  //         margin: EdgeInsets.only(right: 16.0),
  //         child: ListTile(
  //           title: Text(item.title),
  //           onTap: () {
  //             widget.onClickedItem(item.title);
  //           },
  //         ),
  //       )
  //     ],
  //   );
  // }

}
