import 'package:flutter/material.dart';

class ModelScreen extends StatelessWidget {
  const ModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Animal Model Class"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "part 'animal_model.g.dart';\n"
                "\n"
                "@HiveType(typeId: 0)\n"
                "class AnimalModel {\n"
                "\n"
                "@HiveField(0)\n"
                "final String name;\n"
                "\n"
                "@HiveField(1)\n"
                "final String age;\n"
                "\n"
                "@HiveField(2)\n"
                "final bool isMale;\n"
                "\n"
                "const AnimalModel(this.name, this.age, this.isMale);",
                style: TextStyle(color: Colors.indigo),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "NOTE:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
              Text(
                "write this line at top with import packages- part 'model_file.g.dart'"
                "\n"
                "\n"
                ". Annotate the model class with @HiveType(), so the generator knows this should be a TypeAdapter."
                "\n"
                "\n"
                ". Annotate each field you want to save with @HiveField(index), the index is an int and each index should appear once and you shouldn't change it after registering them."
                "\n"
                "\n"
                ". In case you change the field name or its datatype or add a new field. You have to run the type adapter command again and re-run the app to reflect the changes in the app.",
                style: TextStyle(
                    color: Colors.redAccent.shade200,
                    fontWeight: FontWeight.w400),
                softWrap: true,
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      ),
    );
  }
}
