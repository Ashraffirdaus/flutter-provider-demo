import 'package:flutter/material.dart';
import 'package:flutter_provider_tutorial/pages/list_provider.dart';
import 'package:provider/provider.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
        builder: (context, numbersListProvider, child) => Scaffold(
              appBar: AppBar(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  numbersListProvider.add();
                },
                child: const Icon(Icons.add),
              ),
              body: Column(
                children: [
                  Text(
                    numbersListProvider.numbers.last.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: double.maxFinite,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: numbersListProvider.numbers.length,
                        itemBuilder: ((context, index) {
                          return Text(
                            numbersListProvider.numbers[index].toString(),
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          );
                        })),
                  ),
                ],
              ),
            ));
  }
}
