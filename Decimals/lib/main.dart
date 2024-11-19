import 'package:flutter/material.dart';

void main() => runApp(DecimalLearningApp());

class DecimalLearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Decimals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double responsivePadding = screenWidth * 0.35;

    return Scaffold(
      appBar: AppBar(
        title: Text('Decimals'),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: responsivePadding, right: responsivePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:screenSize.height*0.080),
            SectionButton(
              text: 'Learn',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearnPage()),
                );
              },
            ),
            SizedBox(height: screenSize.height*0.050),
            SectionButton(
              text: 'Play',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayPage()),
                );
              },
            ),
            SizedBox(height: screenSize.height*0.050),
            SectionButton(
              text: 'Practice',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PracticePage()),
                );
              },
            ),
            Image.asset(
              'assets/kids.jpeg', // Path to the image you uploaded
              width: screenSize.width*0.8, // You can adjust the width
              height:screenSize.height*0.100, // You can adjust the height
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  SectionButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width*0.05 , vertical: screenSize.height*0.020), // Adjusted button size
        textStyle: TextStyle(fontSize: 18),
        minimumSize:
            Size(200, 60), // Minimum size of the button (width x height)
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12), // Optional: rounded corners for button
        ),
      ),
      child: Text(text),
    );
  }
}

// Learn Page - Contains some basic information about decimals.
class LearnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Decimals'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width*0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What are Decimals?',
              style: TextStyle(fontSize: screenSize.width * 0.08 * 0.8, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:screenSize.height * 0.020),
            Text(
              'Decimals are a way of expressing numbers that are not whole numbers. They are numbers with a dot, called a decimal point. The decimal point separates whole numbers from parts of a number.',
              style: TextStyle(fontSize:screenSize.width*0.055*0.8),
            ),
            SizedBox(height: screenSize.height *0.020),
            Text(
              'Decimal Example:\n'
              '0.1 means one-tenth, 0.01 means one-hundredth, and so on.',
              style: TextStyle(fontSize: screenSize.width*0.05*0.8),
            ),
            Image.asset(
              'assets/decimal1.png', // Path to the image you uploaded
              width:screenSize.width*0.5, // You can adjust the width
              height:screenSize.height * 0.170, // You can adjust the height
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenSize.height *0.020),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

// Play Page - A simple interactive game could be here.
class PlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play with Decimals'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // This could lead to a more detailed game or interactive activity
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Decimal Game'),
                content:
                    Text('This is where the play interaction will happen.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          },
          child: Text('Start a Decimal Game'),
        ),
      ),
    );
  }
}

// Practice Page - Here kids can answer simple decimal-related questions.
class PracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice Decimals'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Decimal Practice',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Question 1: What is 0.7 + 0.3?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Answer',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // You can add logic for validating the answer.
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Result'),
                    content: Text('Great job! Your answer is correct.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Submit Answer'),
            ),
          ],
        ),
      ),
    );
  }
}
