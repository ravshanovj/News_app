import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/home_state.dart';
import 'package:newsapp/data/service/download_file.dart';
import 'package:newsapp/data/service/get_service.dart';
import 'package:newsapp/view/menu_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              // floatingActionButton: FloatingActionButton(onPressed: () async {
              //   ReceivePort receivePort = ReceivePort();

              //   final isolate1 =
              //       await Isolate.spawn(_getFile, receivePort.sendPort);
              //   final isolate2 =
              //       await Isolate.spawn(_getCurrency, receivePort.sendPort);
              //   final result = await receivePort.take(2).toList();
              //   print(result);

              //   isolate1.kill();
              //   isolate2.kill();
              // }),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 238, 236, 236),
                actions: const [
                  SizedBox(width: 50),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "eduon",
                      style: TextStyle(fontSize: 28, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 118),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                  SizedBox(
                    width: 12,
                  )
                ],
                toolbarHeight: 75,
              ),
              body: Builder(builder: (context) {
                if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeErrorState) {
                  return Center(
                    child: Text(state.error),
                  );
                } else if (state is HomeCompleteState) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 400,
                                  height: 220,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(
                                          255, 238, 236, 236)),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 185, left: 240),
                                  child: Container(
                                    width: 130,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green[300],
                                    ),
                                  ),
                                )),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Notiqlik mahorati kursi",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    Icon(
                                      Icons.save_rounded,
                                      color: Colors.blue,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text("Notiqlik.uz"),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("""4.9  13"""),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.person_2_outlined,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("""  39""")
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("""UZS 990000"""),
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.blue,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              }),
              drawer: const Drawer(
                backgroundColor: Colors.black,
                child: MenuPage(),
              )),
        );
      }),
    );
  }
}

// void _getFile(SendPort sendPort) async {
//   print("File olib kelish boshlandi");
//   sendPort.send(await FileService.downloadFile());
// }

// void _getCurrency(SendPort sendPort) async {
//   print("Currency olib kelish boshlandi");
//   sendPort.send(await MyService().getService());
// }
