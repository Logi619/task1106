import 'package:flutter/material.dart';
class qas extends StatefulWidget {
  const qas({super.key});

  @override
  State<qas> createState() => _qasState();
}

class _qasState extends State<qas> {
  final List<Map<String, String>> faqData = [
    {
      'question': 'What is your return policy?',
      'answer': 'You can return any product within 30 days.'
    },
    {
      'question': 'How do I track my order?',
      'answer': 'You can track it from the link sent to your email.'
    },
    {
      'question': 'Do you offer customer support?',
      'answer': 'Yes, we offer 24/7 support through chat and email.'
    },
  ];


  @override
    Widget build (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('FAQ')),
        body: ListView(
          children: faqData.map((faq) {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ExpansionTile(
                title: Text(faq['question']!),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(faq['answer']!),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      );
    }
  }