import 'package:flutter/material.dart';
import 'package:one/data/server_entry/server_entry.dart';
import 'package:one/styles.dart';

class AddServerDialog extends StatefulWidget {
  const AddServerDialog({this.initialEntry, super.key});

  final ServerEntry? initialEntry;

  @override
  State<AddServerDialog> createState() => _AddServerDialogState();
}

class _AddServerDialogState extends State<AddServerDialog> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final nameController = TextEditingController();
  final ipController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.initialEntry?.name ?? "";
    ipController.text = widget.initialEntry?.ip ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Server", style: titleTextStyle),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Server name"),
              validator:
                  (value) =>
                      value != null && value.isNotEmpty
                          ? null
                          : "Enter server name",
            ),
            TextFormField(
              controller: ipController,
              decoration: InputDecoration(hintText: "Server IP"),
              validator:
                  (value) =>
                      value != null && value.isNotEmpty
                          ? null
                          : "Enter server IP",
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton.icon(
          style: TextButton.styleFrom(backgroundColor: Colors.red),
          label: const Text('Delete', style: TextStyle(color: Colors.black)),
          icon: Icon(Icons.delete, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton.icon(
          style: TextButton.styleFrom(backgroundColor: Colors.green),
          label: const Text('Save', style: TextStyle(color: Colors.black)),
          icon: Icon(Icons.save, color: Colors.black),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.of(context).pop(
                ServerEntry(name: nameController.text, ip: ipController.text),
              );
            }
          },
        ),
      ],
    );
  }
}
