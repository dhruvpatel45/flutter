import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _count = 0;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  List<String> _marks = [];
  String _searchResult = '';
  int _occurrences = 0; // To store the count of occurrences
  int _currentIndex = -1; // To track the current mark index

  void _incrementCounter() {
    setState(() {
      String mark = _controller.text;
      if (mark.isNotEmpty) {
        _marks.add(mark);
        _count++;
        _controller.clear();
      }
    });
  }

  void _searchMark() {
    setState(() {
      String searchMark = _searchController.text;
      _occurrences = _marks.where((mark) => mark == searchMark).length; // Count occurrences
      _searchResult = _occurrences > 0 ? 'Yes' : 'No';
      _searchController.clear();
    });
  }

  void _showFirstMark() {
    setState(() {
      if (_marks.isNotEmpty) {
        _currentIndex = 0;
      }
    });
  }

  void _showNextMark() {
    setState(() {
      if (_currentIndex < _marks.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _showPreviousMark() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  void _showLastMark() {
    setState(() {
      if (_marks.isNotEmpty) {
        _currentIndex = _marks.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mark List Display')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your mark below:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter mark',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Save'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Count: $_count',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text(
              'Search for a mark:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search mark',
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _searchMark,
                child: const Text('Find'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _searchResult,
              style: const TextStyle(fontSize: 24),
            ),
            if (_occurrences > 0) // Show occurrences if greater than 0
              Text(
                'Occurrences: $_occurrences',
                style: const TextStyle(fontSize: 24),
              ),
            const SizedBox(height: 20),
            // Display the current mark if available
            if (_currentIndex >= 0 && _currentIndex < _marks.length)
              Text(
                'Current Mark: ${_marks[_currentIndex]}',
                style: const TextStyle(fontSize: 24),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children : [
                ElevatedButton(
                  onPressed: _showFirstMark,
                  child: const Text('Show 1st Mark'),
                ),
                ElevatedButton(
                  onPressed: _currentIndex < _marks.length - 1 ? _showNextMark : null,
                  child: const Text('Show Next Mark'),
                ),
                ElevatedButton(
                  onPressed: _currentIndex > 0 ? _showPreviousMark : null,
                  child: const Text('Show Prev Mark'),
                ),
                ElevatedButton(
                  onPressed: _showLastMark,
                  child: const Text('Show Last Mark'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
