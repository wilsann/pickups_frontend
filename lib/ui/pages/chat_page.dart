part of 'pages.dart';

// String randomString() {
//   final random = Random.secure();
//   final values = List<int>.generate(16, (i) => random.nextInt(255));
//   return base64UrlEncode(values);
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key key});

//   @override
//   Widget build(BuildContext context) => const MaterialApp(
//         home: ChatPage(),
//       );
// }

// class ChatPage extends StatefulWidget {
//   const ChatPage({Key key}) : super(key: key);

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   final List<types.Message> _messages = [];
//   final UserLoaded =
//       const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: Chat(
//           messages: _messages,
//           onSendPressed: _handleSendPressed,
//           user: UserLoaded,
//         ),
//       );

//   void _addMessage(types.Message message) {
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }

//   void _handleSendPressed(types.PartialText message) {
//     final textMessage = types.TextMessage(
//       author: UserLoaded,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       id: randomString(),
//       text: message.text,
//     );

//     _addMessage(textMessage);
//   }
// }

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Tawk(
        directChatLink:
            'https://tawk.to/chat/62c439a2b0d10b6f3e7ae716/1g77829dh',
        visitor: TawkVisitor(
          name: '',
          email: '',
        ),
      ),
    ));
  }
}
