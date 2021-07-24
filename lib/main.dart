import 'package:flutter/material.dart';
import 'package:que_project/Que_Brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'AlertStyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('QuestionAnswer'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(child: QuizeBody()),
    ));
  }
}

class QuizeBody extends StatefulWidget {
  const QuizeBody({Key? key}) : super(key: key);

  @override
  _QuizeBodyState createState() => _QuizeBodyState();
}

class _QuizeBodyState extends State<QuizeBody> {
  QuizeBrain que_brain = QuizeBrain();

  void checkAnswer(bool answer) {
    setState(() {
      if (que_brain.getAnswer() == answer) {
        que_brain.result.add(Icon(Icons.check, color: Colors.green));
      } else {
        que_brain.result.add(Icon(Icons.close, color: Colors.red));
      }
      if (que_brain.que_Finished()) {
        Alert(
          context: context,
          style: alertStyle,
          title: '',
          desc: 'End of Question',
          buttons: [
            DialogButton(
              child: Text(
                "End",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  que_brain.resetQuize();
                });
              },
              width: 120,
            )
          ],
        ).show();
      } else {
        que_brain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Question:' +
                  (que_brain.current_question + 1).toString() +
                  '-' +
                  que_brain.count_Question().toString(),
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  que_brain.getQuestion(),
                  style: TextStyle(fontSize: 35.0, color: Colors.white),
                ),
              ),
            )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FlatButton(
            color: Colors.green,
            onPressed: () {
              checkAnswer(true);
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ),
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FlatButton(
                color: Colors.red,
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text('No',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: que_brain.result,
          ),
        )
      ],
    );
  }
}
