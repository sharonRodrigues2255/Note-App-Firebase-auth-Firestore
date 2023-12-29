import 'package:flutter/material.dart';
import 'package:flutter_check/controller/navigations.dart';
import 'package:google_fonts/google_fonts.dart';

class ShareAMemory extends StatefulWidget {
  const ShareAMemory({Key? key}) : super(key: key);

  @override
  _ShareAMemoryState createState() => _ShareAMemoryState();
}

class _ShareAMemoryState extends State<ShareAMemory> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Share a Memory',
          style: GoogleFonts.merriweather(color: Colors.white),
        ),
        actions: [
          SubmitButton(
            textLength: _textEditingController.text.length,
          ),
        ],
      ),
      body: Padding(
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
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _textEditingController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: 'Share your memory...', border: InputBorder.none),
              onChanged: (text) {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final int textLength;

  const SubmitButton({Key? key, required this.textLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: textLength > 10
            ? () {
                // Your submit logic goes here
                popScreen(context);
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
