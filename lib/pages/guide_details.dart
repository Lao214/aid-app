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
              padding: const EdgeInsets.only(left: 14.0,right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF106510),
                      borderRadius: BorderRadius.circular(10.0), // 圆角半径
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    margin: const EdgeInsets.symmetric(vertical: 7.0),
                    child: const Text('FIRST AID STEPS',style: TextStyle(color: Colors.white,fontSize: 14.0),),
                  ),
                  const SizedBox(height: 10), // 添加垂直间距
                  IntrinsicHeight(
                    child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: const Text('1.',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 14.0),),
                            ),
                          ),
                          Expanded(
                            flex: 14,
                            child: Wrap(
                              children: [
                                const Text('Always '),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  margin:  const EdgeInsets.symmetric(horizontal: 1.0),
                                  decoration: BoxDecoration(
                                    border:  Border.all(color: Colors.red),
                                    color: const Color(0xFFECC8CB),
                                    borderRadius: BorderRadius.circular(7.0), // 圆角半径
                                  ),
                                  child: const Text('CALL 9-1-1',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                                ),
                                const Text(' for an abdominal injury(see'),
                                GestureDetector(
                                  onTap: () {
                                    // 处理点击事件的逻辑
                                    // print('文本被点击了');
                                  },
                                  child: const Text(
                                    'Abdominal Injury',
                                    style: TextStyle(
                                      color: Colors.blue, // 设置文本颜色
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline, // 添加下划线
                                    ),
                                  ),
                                ),
                                const Text(').'),
                              ],
                            ),
                          ),
                        ]
                    )
                  ),
                  const SizedBox(height: 10), // 添加垂直间距
                  IntrinsicHeight(
                      child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.topCenter,
                                child: const Text('2.',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 14.0),),
                              ),
                            ),
                            const Expanded(
                              flex: 14,
                              child: Wrap(
                                children: [
                                  Text('2. Seek urgent medical atten tion for any severe abdominal pain in the following situations.')
                                ],
                              ),
                            ),
                          ]
                      )
                  ),
                  const SizedBox(height: 10), // 添加垂直间距
                  const Wrap(
                    children: [
                      Text('In adults:',style: TextStyle(fontWeight: FontWeight.w700),)
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF106510),
                      borderRadius: BorderRadius.circular(10.0), // 圆角半径
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    margin: const EdgeInsets.symmetric(vertical: 7.0),
                    child: const Text('SIGNS AND SYMPTOMS',style: TextStyle(color: Colors.white,fontSize: 14.0),),
                  ),
                  IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: const Text('·',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 14.0),),
                            ),
                          ),
                          Expanded(
                            flex: 14,
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: const Text('Sudden, severe, intolerable pain or pain that causes awakening from sleep',style: TextStyle(fontSize: 14.0),),
                            ),
                          ),
                        ],
                      ),
                    )
                  )
                ],
              ),
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
    return  Container(
        color: Colors.white, // 设置吸顶区域的背景颜色
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Text(
          '文章标题',
          textAlign: TextAlign.left,
          style: TextStyle(
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
