import 'package:flutter/material.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

Future<void> main() async {
  // Ensure Flutter is able to communicate with Plugins
  WidgetsFlutterBinding.ensureInitialized();

    // Initialize Stream video and set the API key along with the user for our app.
  final client = StreamVideo(
    'pefx27yhuzzs',
    user: User.regular(userId: 'hello', name: 'abdullah'),
    userToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiaGVsbG8ifQ.D0UsX7ACBspeOoaGwL7FUJZ5PoHwlm9pS-3hNTC4uwk',
    options: const StreamVideoOptions(
      logPriority: Priority.info,
    ),
  );

  // Set up our call object
  final call = client.makeCall(type: 'default', id: '345');
  await call.getOrCreate();
  // Connect to the call we created
  await call.join();
  final outputDevices = RtcMediaDeviceNotifier.instance.audioOutputs();
  final inputDevices = RtcMediaDeviceNotifier.instance.audioInputs();
  // final videoDevices = RtcMediaDeviceNotifier.instance.videoInputs();
  call.setAudioInputDevice(inputDevices as RtcMediaDevice);
  call.setAudioOutputDevice(outputDevices as RtcMediaDevice);
  call.setMicrophoneEnabled(enabled: true);
  call.setCameraEnabled(enabled: true);
   runApp(
    MaterialApp(
      home: MyApp(
        call: call,
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.call}) : super(key: key);

  final Call call;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr, // or TextDirection.rtl based on your app's language direction
        child: Scaffold(
          
          body: StreamCallContainer(
            call: call,
           
          ),
        ),
      ),
    );
  }
}