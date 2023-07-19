import 'package:aid/pages/guide_details.dart';
import 'package:flutter/material.dart';
import '../components/alphabetlist_scrollview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late TextEditingController _textEditingController;


  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    //构建字母widgets,采用Expanded方便后续扩展.
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void onTextChanged(String value) {
    // 处理搜索文本变化的逻辑
    // print('Search text changed: $value');
  }

  void onSubmitted(String value) {
    // 处理提交搜索的逻辑
    // print('Search submitted: $value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Container(
          // 设置与AppBar底部的距离为10.0
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _textEditingController,
            onChanged: onTextChanged,
            decoration: InputDecoration(
              label: const Text('Search'),
              hintText: 'Enter a keyword',
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  onSubmitted(_textEditingController.text);
                },
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _textEditingController.clear();
                },
              ),
            ),
          ),
        ),
      ),
      body:  AlphabetListScrollView(
        onClickedItem: (item) {
          // print(item);
          Navigator.push(
              context,
              MaterialPageRoute( builder: (context) =>  GuideDetailsPage(title: item,))
          );
        },
        items:const [
          'Able', 'Apple', 'All', 'Ask', 'Alive', 'After', 'Against', 'Animal', 'Amount', 'Attack',
          'Bird', 'Blue', 'Ball', 'Black', 'Bottle', 'Book', 'Before', 'Big', 'Building', 'Burn',
          'Cat', 'Car', 'Cold', 'Call', 'Carry', 'Come', 'City', 'Child', 'Change', 'Close',
          'Dog', 'Day', 'Dark', 'Door', 'Down', 'Dream', 'Draw', 'Drive', 'Dance', 'Drop',
          'Eat', 'Eye', 'Early', 'End', 'Easy', 'Enter', 'Earth', 'Every', 'Evening', 'Escape',
          'Fish', 'Fun', 'Fall', 'Fire', 'Fly', 'Friend', 'Fast', 'Food', 'Flower', 'Finish',
          'Go', 'Good', 'Great', 'Green', 'Give', 'Game', 'Girl', 'Get', 'Grow', 'Group',
          'Hat', 'Help', 'Hot', 'House', 'Hold', 'Hear', 'Hope', 'High', 'Hit', 'Hurt',
          'Ice', 'In', 'Inside', 'Island', 'Invite', 'Interesting', 'Idea', 'Important', 'Imagine', 'Increase',
          'Jump', 'Joy', 'Joke', 'Job', 'Jungle', 'Jacket', 'Join', 'Journey', 'Just', 'Jam',
          'Key', 'Kind', 'Keep', 'King', 'Kiss', 'Kid', 'Kick', 'Kitchen', 'Knock', 'Know',
          'Love', 'Lake', 'Light', 'Leaf', 'Look', 'Laugh', 'Long', 'Loud', 'Learn', 'Listen',
          'Mouse', 'Moon', 'Make', 'Man', 'Music', 'Mountain', 'Move', 'Much', 'Meet', 'Mind',
          'Night', 'Name', 'New', 'Never', 'Next', 'Now', 'Nice', 'Near', 'North', 'Note',
          'Orange', 'Open', 'Old', 'Out', 'One', 'Ocean', 'Over', 'Only', 'Often', 'Object',
          'People', 'Place', 'Play', 'Please', 'Pretty', 'Park', 'Picture', 'Push', 'Part', 'Paint',
          'Queen', 'Quick', 'Quiet', 'Question', 'Quarter', 'Quite', 'Quilt', 'Queue', 'Quality', 'Quote',
          'Red', 'Run', 'Rain', 'Read', 'Rise', 'Road', 'Room', 'Remember', 'Rock', 'Reach',
          'Sun', 'Star', 'Small', 'Stop', 'Say', 'Smile', 'Sit', 'Street', 'See', 'Sleep',
          'Tree', 'Time', 'Two', 'Take', 'Turn', 'Town', 'Table', 'Talk', 'Think', 'Try',
          'Under', 'Up', 'Use', 'Us', 'Until', 'Understand', 'Umbrella', 'Upset', 'Universe', 'Unique',
          'Voice', 'Very', 'Village', 'Visit', 'Van', 'Violet', 'Volcano', 'Vase', 'Vegetable', 'Value',
          'Water', 'Wind', 'World', 'Walk', 'Work', 'Wave', 'Watch', 'Well', 'Wonder', 'Write',
          'Xylophone', 'X-ray', 'Xenon', 'Xerox', 'Xmas', 'Xylophone', 'Xenon', 'X-ray', 'Xenophobia', 'Xylitol',
          'Yellow', 'Young', 'Year', 'Yell', 'Yawn', 'Yard', 'Yes', 'Yoga', 'You', 'Yummy',
          'Zebra', 'Zoom', 'Zero', 'Zone', 'Zoo', 'Zeal', 'Zinc', 'Zigzag', 'Zipper', 'Zealous'
        ]
      ),
    );
  }
}
