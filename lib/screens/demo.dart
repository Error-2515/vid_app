import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
// import 'package:vid_app/screens/call_screen.dart';
// ignore: implementation_imports
// import 'package:stream_video_flutter/src/call_screen/call_container.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart' as sv;
// import 'package:vid_app/main.dart';

class ConView extends StatelessWidget {
  const ConView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamUserListView(
  onUserTap: (User user) async {
    const nameid = 'Super Mario';
    const userid = 'super_mario_og';

    final vclient =  sv.StreamVideo(
    'pgngfnbpjdf2',
    user: const sv.User(info: sv.UserInfo(id: userid,name: nameid)),
    userToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic3VwZXJfbWFyaW9fb2cifQ.ffMcvt7Afz6khYJG0RG21YmH1Ez1ddWxwA4mGMem0ss',
    options: const  sv.StreamVideoOptions(
      logPriority:  sv.Priority.info,
    ),
  );
    // Set up our call object
  final call = vclient.makeCall(type: 'default', id: '345');
  await call.getOrCreate(memberIds: [StreamChat.of(context).currentUser!.id, user.id]);
  // Connect to the call we created
  await call.join();

    
    
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => sv.StreamCallContainer(
                        call: call,
                      ),
                    ),
                  );
  },
  controller: StreamUserListController(
    client: StreamChat.of(context).client,
    filter: Filter.and(
      [
        Filter.notEqual(
          'id',
          StreamChat.of(context).currentUser!.id,
        ),
      ],
    ),
  ),
),
    );
  }
}