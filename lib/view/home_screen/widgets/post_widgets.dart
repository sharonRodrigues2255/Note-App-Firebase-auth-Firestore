import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyanAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        height: 200,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    data['username'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text("Date: ${data['date']}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                data['note'],
                overflow: TextOverflow.ellipsis,
                maxLines: 6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
