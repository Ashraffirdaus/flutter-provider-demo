import 'package:flutter/material.dart';
import 'package:flutter_provider_tutorial/pages/list_provider.dart';
import 'package:flutter_provider_tutorial/pages/second.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
          builder: (context, numbersProviderModel, child) =>Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numbersProviderModel.add();
          },
          child: const Icon(Icons.add),
        ),
        body:  SizedBox(
            child: Column(
              children: [
                Text(
                 numbersProviderModel. numbers.last.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: numbersProviderModel.numbers.length,
                    itemBuilder: ((context, index) {
                      return Text(
                        numbersProviderModel.numbers[index].toString(),
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      );
                    }),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Second())));
                  },
                  child: const Text("Second"),
                ),
              ],
            ),
          ),
        ));
  }
}
