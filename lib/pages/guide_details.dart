import 'package:aid/components/details_tag.dart';
import 'package:aid/components/my_richText.dart';
import 'package:aid/components/details_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:aid/service/aid_guide.dart';
import 'dart:convert';


class GuideDetailsPage extends StatefulWidget {

  final String title;

  const GuideDetailsPage({super.key, required this.title});

  @override
  State<GuideDetailsPage> createState() => _GuideDetailsPageState();
}

class _GuideDetailsPageState extends State<GuideDetailsPage> {
  List<Widget> widgetList = [];

  List<Map<String, dynamic>>  myWidgetForEach(List<Map<String, dynamic>> list) {
    for (int i = 0; i < list.length; i++) {
      Map<String, dynamic> item = list[i];
      // Process each map item here
      print('Item ${i + 1}: ${item['widgetType']} - ${item['title']}');
      if(item['widgetType'] == 'MyDetailsTag') {
        widgetList.add(
            MyDetailsTag(title: item['title'], marginLeft: item['marginLeft'].toDouble())
        );
        widgetList.add(
            const SizedBox(height: 10)
        );
      } else if (item['widgetType'] == 'DetailsSubtitle') {
        widgetList.add(
            DetailsSubtitle(title: item['title'], marginLeft: item['marginLeft'].toDouble())
        );
        widgetList.add(
            const SizedBox(height: 10)
        );
      }
      else if (item['widgetType'] == 'MyRichText') {
        List<Widget> widgets = [];
        for(int j = 0; j < item['widgets'].length; j++) {
          Map<String, dynamic> itemWidgets = item['widgets'][j];
          if (itemWidgets['widgetType'] == 'Sort') {
            widgets.add(
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child:  Text(itemWidgets['title'],style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 14.0,height: 1.5),),
                  )
              ),
            );
          } else if (itemWidgets['widgetType'] == 'RichText') {
            List<InlineSpan> exChildren = [];
            for(int k = 0; k < itemWidgets['children'].length; k++) {
              Map<String, dynamic> childWidget = itemWidgets['children'][k];
              if (childWidget['widgetType'] == 'TextSpan') {
                exChildren.add(
                    TextSpan(text:childWidget['title'],style: const TextStyle(color: Colors.black,fontSize: 15.0,))
                );
              } else if (childWidget['widgetType']== 'redSpan') {
                exChildren.add(
                  WidgetSpan(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 0.0),
                        decoration: BoxDecoration(
                            color:  const Color.fromRGBO(255, 241, 241, 1.0), // 背景颜色
                            borderRadius: BorderRadius.circular(8.0), // 圆角
                            border:  Border.all(color: Colors.red)
                        ),
                        child:  Text(childWidget['title'], style: const TextStyle(color: Colors.red,fontSize: 12.0),),
                      )
                  ),
                );
              } else if (childWidget['widgetType'] == 'linkSpan') {
                exChildren.add(
                  WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          // 处理点击事件的逻辑
                          // print('文本被点击了');
                        },
                        child: Text(childWidget['title'], style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 15.0)),
                      )
                  ),);
              }
            }
            widgets.add(
                Expanded(
                    flex: 14,
                    child: RichText(
                      text: TextSpan(
                          children: exChildren
                      ),
                    )
                )
            );
          }
        }
        widgetList.add(
          MyRichText(widgets: widgets,marginLeft: 0.0),
        );
        widgetList.add(
            const SizedBox(height: 10)
        );
      }
    }
    return list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 在这里进行初始化工作
    // 例如，进行网络请求、设置初始状态等
    // 发起网络请求
    List<Map<String, dynamic>> list = [];
    AidGuideService().getGuideDetails(widget.title).then((value) {
      var jsonData = json.decode(value);
      list = List<Map<String, dynamic>>.from(jsonData);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$wsk')));
      setState(() {
        list = myWidgetForEach(list);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title),backgroundColor: Colors.teal,),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true, // 启用吸顶效果
              delegate: CustomHeaderDelegate(title: widget.title),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(left: 14.0,right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // children: [
                  //   const MyDetailsTag(title: 'FIRST AID STEPS', marginLeft: 0.0),
                  //   const SizedBox(height: 10), // 添加垂直间距
                  //   MyRichText(widgets: widgets,marginLeft: 0.0),
                  //   const SizedBox(height: 10), // 添加垂直间距
                  //   MyRichText(widgets: widgets2,marginLeft: 0.0),
                  //   const SizedBox(height: 10), // 添加垂直间距
                  //   const DetailsSubtitle(title: 'In adults: ', marginLeft: 0.0),
                  //   const MyDetailsTag(title: 'SIGNS AND SYMPTOMS', marginLeft: 0.0),
                  //   MyRichText(widgets: widgets3,marginLeft: 11.0),
                  // ],
                  children: widgetList,
                ),
              ),
            ),
          ],
        )

    );
  }
}


class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  late String title;

  CustomHeaderDelegate({required this.title});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return  Container(
        color: Colors.white, // 设置吸顶区域的背景颜色
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child:  Text( title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF106510),
          ),
        ),
    );
  }

  @override
  double get maxExtent => 45.0; // 设置吸顶区域的最大高度

  @override
  double get minExtent => 45.0; // 设置吸顶区域的最小高度

  @override
  bool shouldRebuild(CustomHeaderDelegate oldDelegate) => false;
}
