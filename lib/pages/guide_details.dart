import 'package:flutter/material.dart';


class GuideDetailsPage extends StatelessWidget {
  final String title;

  const GuideDetailsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),backgroundColor: Colors.teal,),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true, // 启用吸顶效果
            delegate: CustomHeaderDelegate(),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Container()
            ),
          ),
        ],
      )
    );
  }
}


class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // 设置吸顶区域的背景颜色
      child:  Center(
        child: Text('吸顶标题',style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 20.0)), // 设置吸顶的标题文本
      ),
    );
  }

  @override
  double get maxExtent => 50.0; // 设置吸顶区域的最大高度

  @override
  double get minExtent => 50.0; // 设置吸顶区域的最小高度

  @override
  bool shouldRebuild(CustomHeaderDelegate oldDelegate) => false;
}
