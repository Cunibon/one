import 'package:flutter/material.dart';

class SkipTurnDialog extends StatelessWidget {
  const SkipTurnDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Skip your turn?"),
      actions: [
        ElevatedButton(
          style: TextButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('Yes', style: TextStyle(color: Colors.black)),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        ElevatedButton(
          style: TextButton.styleFrom(backgroundColor: Colors.green),
          child: const Text('No', style: TextStyle(color: Colors.black)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
