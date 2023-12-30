import 'package:flutter/material.dart';
import 'package:flutter_check/controller/navigations.dart';
import 'package:flutter_check/controller/share_a_memory_controller.dart';
import 'package:flutter_check/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShareAMemory extends StatefulWidget {
  const ShareAMemory({Key? key}) : super(key: key);

  @override
  _ShareAMemoryState createState() => _ShareAMemoryState();
}

class _ShareAMemoryState extends State<ShareAMemory> {
  @override
  void initState() {
    textToSpeechService.speak("Share your wonderful memories");
    super.initState();
  }

  TextEditingController _titleController = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();

  void speakFeedback(String feedback) {
    textToSpeechService.speak(feedback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            popScreen(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.red,
        title: Text(
          'Share a Memory',
          style: GoogleFonts.merriweather(color: Colors.white),
        ),
        actions: [
          SubmitButton(
            textLength: _textEditingController.text.length,
            note: _textEditingController.text,
            title: _titleController.text,
            speakFeedback: speakFeedback,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                onTap: () {
                  speakFeedback("Enter the title for your memory");
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _textEditingController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Share your memory...',
                  border: InputBorder.none,
                ),
                onChanged: (text) {
                  speakFeedback(" $text");
                  setState(() {});
                },
                onTap: () {
                  speakFeedback("Type your memory here");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final int textLength;
  final String? title;
  final String note;
  final Function(String) speakFeedback;

  const SubmitButton({
    Key? key,
    required this.textLength,
    required this.note,
    required this.title,
    required this.speakFeedback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: textLength > 10
            ? () async {
                await Provider.of<ShareAMemoryController>(context,
                        listen: false)
                    .addAmemmory(note: note, title: title ?? "");
                popScreen(context);
                speakFeedback("Memory submitted successfully");
              }
            : null,
        style: ElevatedButton.styleFrom(
          primary: textLength > 10 ? Colors.white : Colors.grey,
        ),
        child: Text('Submit', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
