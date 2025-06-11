import 'package:flutter/material.dart';
class col extends StatefulWidget {
  const col({super.key});

  @override
  State<col> createState() => _colState();
}

class _colState extends State<col> {
  Color _selectedColor = Colors.white;

  void _changeColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Color Picker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // The box whose color changes
          Container(
            width: 200,
            height: 200,
            color: _selectedColor,
            child: Center(child: Text('Color Box')),
          ),
          SizedBox(height: 30),
          // Color buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent),
                onPressed: () => _changeColor(Colors.amberAccent),
                child: Text('amberAccent'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                onPressed: () => _changeColor(Colors.deepPurple),
                child: Text('deep purple'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: () => _changeColor(Colors.pink),
                child: Text('Green'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

