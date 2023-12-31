import 'package:flutter/material.dart';

import '../helper/db_helper.dart';
import '../helper/utils.dart';

class BackupScreen extends StatefulWidget {
  @override
  _BackupScreenState createState() => _BackupScreenState();
}

class _BackupScreenState extends State<BackupScreen> {
  final dbHelper = DatabaseHelper.instance;

  Future<void> _backup() async {
    await dbHelper.backup();
  }

  _restore() async {
    final dumpFilePath = await chooseFile();
    if (dumpFilePath != null) {
      await dbHelper.restore(dumpFilePath);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: _restore,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.restore),
                            Text(
                              'Restore',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: _backup,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.backup),
                            Text(
                              'Backup',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
