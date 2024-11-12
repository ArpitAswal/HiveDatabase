import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'animal_model.dart';
import 'crud_screen.dart';
import 'model_screen.dart';

void main() async {
  // It is used so that void main function
  // can be initiated after successfully
  // initialization of data
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // initialize hive in the application
  Hive.registerAdapter(AnimalModelAdapter()); //register the type adapter
  Hive.openBox<AnimalModel>('Animal'); // open a hive box
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive Database',
      theme: ThemeData(
          useMaterial3: true,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.lightBlue)),
          colorScheme: ColorScheme(
            primary: Colors.blue,
            secondary: Colors.amberAccent, // Background color
            surface:
                Colors.grey.shade200, // Surface color (for elements like cards)
            onPrimary: Colors.white, // Text color on primary background
            onSecondary: Colors.redAccent, // Text color on background
            onSurface: Colors.black, brightness: Brightness.light,
            error: Colors.redAccent, onError: Colors.black87,
          )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hive Database"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "First we will set up Hive into our application by adding necessary packages and initialize in main method",
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                "What is Hive Type Adapters?. Let's see",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black87),
              ),
              const SizedBox(height: 6),
              const Text(
                "Hive is a NoSQL database that stores data in key-value pairs. Where value can be of a different type such as int, string, list, or custom objects. To store custom objects in Hive, we need to define type adapters that tell Hive how to serialize and deserialize our objects. We can use the hive_generator package to generate type adapters for our custom objects automatically. This means we will create a model class and store that entire modal in Hive.",
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ModelScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  "see here",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Text(
                "After creating model, run the following command to generate TypeAdapter",
                softWrap: true,
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                color: Colors.grey.shade300,
                child: const Text(
                  "flutter packages pub run build_runner build",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              const Text(
                "After creating modelfile.g.dart, register the adapter in main function",
                softWrap: true,
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                "Storing Data in Hive",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              const Text(
                  "To store data in Hive, we need to open a Hive box. A box is similar to a table in a traditional SQL database and stores key-value pairs. We can open a box by calling the Hive.openBox() method and passing in the name of the box as a parameter."),
              const Row(
                children: [
                  Text(
                    "For Example: ",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "Hive.openBox<AnimalModel>('Animal');",
                    style: TextStyle(color: Colors.redAccent),
                  )
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                  "We can open the same box multiple times, returning us the same box instance. However, it is good practice to open it once on app launch and get the box whenever we want to add/update/delete data from it."),
              const Row(
                children: [
                  Text(
                    "For Example: ",
                    style: TextStyle(color: Colors.black),
                  ),
                  Expanded(
                      child: Text(
                    "Box<AnimalModel> box = Hive.box<AnimalModel>('Animal');",
                    style: TextStyle(color: Colors.redAccent),
                    softWrap: true,
                  ))
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CrudScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  "CRUD Operation",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
