import 'dart:io';

import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  const StatusTile({
    required this.status,
    super.key,
  });

  final FileSystemEntity status;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(status.path),
      subtitle: Text(status.toString()),
    );
  }
}
