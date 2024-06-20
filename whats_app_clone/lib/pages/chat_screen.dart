import 'package:flutter/material.dart';
import '../modals/chat_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) => Column(
          
          children: [
            Divider(),
            ListTile(
              leading: CircleAvatar(
            
                backgroundImage: NetworkImage(dummyData[index].avataUrl),
                ),
                title: Text(dummyData[index].name,style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
                subtitle: Text(dummyData[index].message,style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),),
                trailing: Text(dummyData[index].time,style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),),
            )
          ],
          ),
      ),
    );
  }
}