import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _nameController = TextEditingController();

  void _submitData() {
    final nameInput = _nameController.text;
    if (nameInput.isEmpty ) {
      return;
    }

    print(nameInput);

    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 100),
          child: Column(
            children: const [
              Text(
                'Financatron',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w200,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: const [
              Text(
                'For a world without banks.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 300),
          child: Column(
            children: const [
              Text(
                'Type your name please:',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          width: 300,
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: _nameController,
                onSubmitted: (_) => _submitData,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
