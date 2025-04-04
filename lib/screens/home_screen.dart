import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:one/application_constants.dart';
import 'package:one/data/client.dart';
import 'package:one/routes.dart';
import 'package:one/widgets/normed_width.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = localStorage.getItem(nameKey) ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NormedWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                onChanged: (value) => localStorage.setItem(nameKey, value),
                decoration: InputDecoration(helperText: "Username"),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => context.goNamed(serverListRoute.name!),
                    label: Text("Server list"),
                    icon: Icon(Icons.dns),
                  ),
                  if (!kIsWeb)
                    ElevatedButton.icon(
                      onPressed: () {
                        ref.read(serverIPProvider.notifier).setIP(localHost);
                        context.goNamed(gameHostRoute.name!);
                      },
                      label: Text("Host server"),
                      icon: Icon(Icons.router),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
