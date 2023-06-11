import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:newsapp/data/service/download_file.dart';
import 'package:newsapp/data/service/get_service.dart';

class IsolatePage extends StatelessWidget {
  const IsolatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        ReceivePort receivePort = ReceivePort();

        final isolate1 = await Isolate.spawn(_getFile, receivePort.sendPort);
        final isolate2 =
            await Isolate.spawn(_getCurrency, receivePort.sendPort);
        final result = await receivePort.take(2).toList();
        print(result);

        isolate1.kill();
        isolate2.kill();
      }),
      body: FutureBuilder(
        future: MyService().getService(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            List data = snapshot.data as List;
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]["title"]),
                );
              },
              itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}

void _getFile(SendPort sendPort) async {
  print("File olib kelish boshlandi");
  sendPort.send(await FileService.downloadFile());
}

void _getCurrency(SendPort sendPort) async {
  print("Currency olib kelish boshlandi");
  sendPort.send(await MyService().getService());
}
