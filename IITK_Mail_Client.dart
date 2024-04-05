import 'package:flutter/material.dart';

void main() {
  runApp(EmailApp());
}

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InboxView(),
    );
  }
}

class InboxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: ListView.builder(
        itemCount: 5, // 5 email messages
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Sender $index'),
            subtitle: Text('Subject $index'),
            trailing: Text('Timestamp'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessageView(
                    sender: 'Sender $index',
                    subject: 'Subject $index',
                    body: 'Message content $index',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MessageView extends StatelessWidget {
  final String sender;
  final String subject;
  final String body;

  MessageView(
      {required this.sender, required this.subject, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From: $sender'),
            Text('Subject: $subject'),
            SizedBox(height: 16),
            Text('Message:'),
            Text(body),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle attachments
              },
              child: Text('View Attachments'),
            ),
          ],
        ),
      ),
    );
  }
}

class ComposeEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'To',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Subject',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Compose your message...',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Bold'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Italic'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Underline'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Send email functionality
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
