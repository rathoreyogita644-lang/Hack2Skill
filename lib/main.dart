import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/chat_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const VenueAssistApp());
}

class VenueAssistApp extends StatelessWidget {
  const VenueAssistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venue Assist',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ChatScreen(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      ),
    );
  }
}
