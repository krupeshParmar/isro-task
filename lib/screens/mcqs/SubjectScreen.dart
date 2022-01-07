import 'package:flutter/material.dart';
import 'package:isro/models/Subjects.dart';

import 'Options.dart';

class SubjectScreen extends StatefulWidget {
  final Subject subject;
  const SubjectScreen({Key? key, required this.subject}) : super(key: key);

  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  int quesIndex = 0;
  int selectedAnswer = -1;
  int score = 0;
  String difficulty = 'Difficulty: Easy';

  @override
  void initState() {
    super.initState();
  }

  void setAnswer(int ans) {
    if (selectedAnswer == ans) {
      setState(() {
        selectedAnswer = -1;
      });
      return;
    }
    setState(() {
      selectedAnswer = ans;
      print(selectedAnswer);
    });
  }

  submitAnswer() {
    if (selectedAnswer == widget.subject.questions[quesIndex].answer) {
      score += 1;
    }
    setState(() {
      selectedAnswer = -1;
      if (quesIndex < widget.subject.questions.length) quesIndex += 1;
    });
    if (quesIndex == 3)
      setState(() {
        difficulty = 'Difficulty: Medium';
      });
    if (quesIndex == 6)
      setState(() {
        difficulty = 'Difficulty: Hard';
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.subject.name),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: quesIndex < widget.subject.questions.length
            ? ListView(
                children: [
                  SizedBox(height: 8.0),
                  Text(
                    'Multiple Choice Questions',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    difficulty,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    child: ListTile(
                      leading: Text('${quesIndex + 1})',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                      title: Text(
                          '${widget.subject.questions[quesIndex].question}',
                          textAlign: TextAlign.start,
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                      contentPadding: EdgeInsets.all(0.0),
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    thickness: 2.0,
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () => setAnswer(0),
                    child: OptionsScreen(
                      id: 0,
                      selectedId: selectedAnswer,
                      optionName: 'A)',
                      optionValue: widget.subject.questions[quesIndex].op1,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () => setAnswer(1),
                    child: OptionsScreen(
                      id: 1,
                      selectedId: selectedAnswer,
                      optionName: 'B)',
                      optionValue: widget.subject.questions[quesIndex].op2,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () => setAnswer(2),
                    child: OptionsScreen(
                      id: 2,
                      selectedId: selectedAnswer,
                      optionName: 'C)',
                      optionValue: widget.subject.questions[quesIndex].op3,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () => setAnswer(3),
                    child: OptionsScreen(
                      id: 3,
                      selectedId: selectedAnswer,
                      optionName: 'D)',
                      optionValue: widget.subject.questions[quesIndex].op4,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32.0),
                    child: MaterialButton(
                      disabledColor: Colors.blueGrey,
                      elevation: selectedAnswer != -1 ? 4.0 : 0.0,
                      color: Colors.blueAccent,
                      onPressed:
                          selectedAnswer != -1 ? () => submitAnswer() : null,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                'Your score: $score/${widget.subject.questions.length}',
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.w200),
              )),
      ),
    );
  }
}
