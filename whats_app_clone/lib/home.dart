import 'package:flutter/material.dart';

import 'pages/calls_scren.dart';
import 'pages/camera_screen.dart';
import 'pages/chat_screen.dart';
import 'pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  static const List<Tab> homeTabs = <Tab>[
    Tab(icon: Icon(Icons.camera_alt)),
    Tab(text: "CHATS"),
    Tab(text: "STATUS"),
    Tab(text: "CALLS"),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: homeTabs,
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search),color: Theme.of(context).colorScheme.primary),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),color: Theme.of(context).colorScheme.primary),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [CameraScreen(), ChatScreen(), StatusScreen(), CallsScreen()],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        child: Icon(Icons.message),
        onPressed: () {
          print("floating clicked");
        },
      ),
    );
  }
}

