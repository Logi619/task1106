import 'package:flutter/material.dart';
class likee extends StatefulWidget {
  const likee({super.key});

  @override
  State<likee> createState() => _likeeState();
}

class _likeeState extends State<likee> {
  bool isLiked = false;
  int likeCount = 0;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Like Button Toggle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.grey,
                size: 36,
              ),
              onPressed: toggleLike,
            ),
            SizedBox(height: 10),
            Text('Total Likes: $likeCount'),
          ],
        ),
      ),
    );
  }
}
