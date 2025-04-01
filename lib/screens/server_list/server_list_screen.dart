import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/server_entry/server_entry.dart';
import 'package:one/routes.dart';
import 'package:one/screens/server_list/add_server_dialog.dart';
import 'package:one/styles.dart';
import 'package:one/widgets/normed_width.dart';

class ServerListScreen extends StatefulWidget {
  const ServerListScreen({super.key});

  @override
  State<ServerListScreen> createState() => _ServerListScreenState();
}

class _ServerListScreenState extends State<ServerListScreen> {
  late List<ServerEntry> entries;

  @override
  void initState() {
    super.initState();
    final storageResult = localStorage.getItem(serverEntryKey);
    if (storageResult != null) {
      final decoded = jsonDecode(storageResult) as List;
      entries = decoded.map((e) => ServerEntry.fromJson(e)).toList();
    } else {
      entries = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Server list", style: headerTextStyle)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NormedWidth(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: entries.length,
                  itemBuilder:
                      (context, index) => Card(
                        color: Theme.of(context).primaryColorDark,
                        child: ListTile(
                          title: Text(
                            entries[index].name,
                            style: titleTextStyle,
                          ),
                          subtitle: Text(entries[index].ip),
                          trailing: IconButton(
                            onPressed: () async {
                              final result = await showDialog<ServerEntry?>(
                                context: context,
                                builder:
                                    (context) => AddServerDialog(
                                      initialEntry: entries[index],
                                    ),
                                barrierDismissible: false,
                              );

                              setState(() {
                                entries.removeAt(index);
                                if (result != null) {
                                  entries.insert(index, result);
                                }

                                localStorage.setItem(
                                  serverEntryKey,
                                  jsonEncode(entries),
                                );
                              });
                            },
                            icon: Icon(Icons.edit),
                          ),
                          onTap:
                              () => context.goNamed(
                                gameRoute.name!,
                                pathParameters: {'serverIP': entries[index].ip},
                              ),
                        ),
                      ),
                  separatorBuilder: (context, index) => Divider(),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  final result = await showDialog<ServerEntry?>(
                    context: context,
                    builder: (context) => AddServerDialog(),
                  );

                  if (result != null) {
                    setState(() {
                      entries.add(result);
                      localStorage.setItem(serverEntryKey, jsonEncode(entries));
                    });
                  }
                },
                label: Text("Add server"),
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
