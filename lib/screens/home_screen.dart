import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wassap_dl/widgets/status_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<FileSystemEntity> statuses = [];

  void _refreshStatuses() async {
    const rootPath = '/storage/emulated/0/';
    const modPaths = ['', 'GB', 'Yo'];
    String prefix = '';
    String wassapPath = '';

    for (String modPath in modPaths) {
      if (Directory('$rootPath${modPath}WhatsApp').existsSync() &&
          Directory('$rootPath${modPath}WhatsApp/Media/.Statuses')
              .existsSync()) {
        prefix = modPath;
        wassapPath = '$rootPath${modPath}WhatsApp';

        // break;
      }
    }

    final statusesDir = Directory('$wassapPath/Media/.Statuses');
    print('$wassapPath/Media/.Statuses');

    for (FileSystemEntity file in statusesDir.listSync()) {
      if (await file.exists()) {
        statuses.add(file);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wassap DL"),
        actions: [
          IconButton(
            onPressed: () {
              _refreshStatuses();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: SizedBox(
        child: ListView.builder(
          itemCount: statuses.length,
          itemBuilder: (context, index) => StatusTile(
            status: statuses[index],
          ),
        ),
      ),
    );
  }
}
