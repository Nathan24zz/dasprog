import 'package:flutter/material.dart';

class NewTab extends StatefulWidget {
  @override
  _NewTabState createState() => _NewTabState();
}

class _NewTabState extends State<NewTab> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Tab'),
        backgroundColor: Colors.deepOrange,
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.comment), text: 'Comment',),
            Tab(icon: Icon(Icons.subscriptions), text: 'Subscribe',),
            Tab(icon: Icon(Icons.share), text: 'Share',),
            Tab(icon: Icon(Icons.search), text: 'Search',),
            Tab(icon: Icon(Icons.settings), text: 'Setting',),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(child: Text('Comment'),),
          Center(child: Text('Subscribe'),),
          Center(child: Text('Share'),),
          Center(child: Text('Search'),),
          Center(child: Text('Setting'),),
        ],
      ),
    );
  }
}