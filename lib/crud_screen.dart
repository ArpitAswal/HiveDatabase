import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/animal_model.dart';

class CrudScreen extends StatefulWidget {
  const CrudScreen({super.key});

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  List<AnimalModel> list = <AnimalModel>[];
  Box<AnimalModel> box = Hive.box<AnimalModel>('Animal');

  @override
  void initState() {
    super.initState();
    list = box.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CRUD Operation"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          AnimalModel value =
                              const AnimalModel("Foo", "8", false);
                          box.put('cat', value);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          "Create",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          list = box.values.toList();
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            backgroundColor: Colors.green,
                            alignment: Alignment.center),
                        child: const Text(
                          "Read",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          AnimalModel value =
                              const AnimalModel("Mew", "9", true);
                          box.put('cat', value);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          box.delete('cat');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text("There are two ways to add data"),
              const Row(
                children: [
                  Text(
                    "box.add(value)",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    "just gives each value an index and auto increments it.",
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              const Row(
                children: [
                  Text(
                    "box.put('key', value)",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    "you have to specify the key for each value.",
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                  "There are different ways to read data from your boxes:"),
              const Row(
                children: [
                  Text(
                    "box.get('key)",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    "get the value from a key.",
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              const Row(
                children: [
                  Text(
                    "box.getAt(index)",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    "get the value from an index created with box.add().",
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              const Row(
                children: [
                  Text(
                    "box.values",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    "this returns an iterable containing all the items in the box.",
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              const SizedBox(height: 6),
              const Text("There are two ways to update data:"),
              const Row(
                children: [
                  Text(
                    "box.put('key', newValue)",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    "to update that value which match key,",
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              const Row(
                children: [
                  Text(
                    "box.putAt(index, item)",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    "which works like getAt()",
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              const SizedBox(height: 6),
              const Text("Deleting items is similar to getting:"),
              const Row(
                children: [
                  Text(
                    "box.delete('key)",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    "delete by key",
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              const Row(
                children: [
                  Text(
                    "box.deleteAt(index)",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    "delete by index",
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              const Row(
                children: [
                  Text(
                    "box.deleteAll(keys)",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    "accepts an iterable of keys, and deletes all the keys given.",
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                margin: const EdgeInsets.all(12.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.deepPurple),
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.black54,
                          spreadRadius: 4.0,
                          blurRadius: 8.0),
                      BoxShadow(
                          color: Colors.deepPurpleAccent.shade400,
                          spreadRadius: 3.0,
                          blurRadius: 12.0)
                    ]),
                alignment: Alignment.center,
                child: (list.isEmpty)
                    ? const Text("No Data")
                    : ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Gender: ${(list[index].isMale) ? "Male" : "Female"}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Flexible(
                                  flex: 5,
                                  child: Text(
                                    "Name: ${list[index].name}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600),
                                  )),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "Age: ${list[index].age}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
