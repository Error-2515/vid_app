// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as sc;
import 'package:vid_app/screens/demo.dart';
// import 'package:stream_video_flutter/stream_video_flutter.dart' ;

Future<void> main() async {
  // Ensure Flutter is able to communicate with Plugins
  WidgetsFlutterBinding.ensureInitialized();
  
  final client = sc.StreamChatClient('pgngfnbpjdf2', logLevel: sc.Level.INFO);

  const nameid = 'Super Mario';
  const userid = 'super_mario_og';

  await client.connectUser(
      sc.User(
          name: nameid,
          role: 'admin',
          image: 'https://th.bing.com/th/id/OIP.XL9QyTVGCB whEM6Cy9KAAAAA?rs=1&pid=ImgDetMain',
          id: userid),
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic3VwZXJfbWFyaW9fb2cifQ.ffMcvt7Afz6khYJG0RG21YmH1Ez1ddWxwA4mGMem0ss');
  
  // final vclient =  StreamVideo(
  //   'pgngfnbpjdf2',
  //   user: const User(info: UserInfo(id: userid,name: nameid)),
  //   userToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic3VwZXJfbWFyaW9fb2cifQ.ffMcvt7Afz6khYJG0RG21YmH1Ez1ddWxwA4mGMem0ss',
  //   options: const  StreamVideoOptions(
  //     logPriority:  Priority.info,
  //   ),
  // );

  // // Set up our call object
  // final call = vclient.makeCall(type: 'default', id: '345');
  // await call.getOrCreate();
  // // Connect to the call we created
  // await call.join();

  runApp(
    MyApp(
      client: client,
      
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  var client;
  var call;
// , required this.call
  MyApp({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: sc.StreamChat(client: client, child: const ConView()),
      debugShowCheckedModeBanner: false,
    );
  }
}
