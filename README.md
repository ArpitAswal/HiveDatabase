
# Project Title: Hive Database Integration in FLutter

Hive is a lightweight and fast NoSQL database that can be used to store data in Flutter applications. In this repo, we will explore how to setup and use Hive database in Flutter.

In this repo, we’ll go over these steps to build a simple CRUD app that stores animals data with hive:

. Setup Hive

. Type Adapters

. Storing data

. Reading data

. Update and Delete data

## Step 1. Setup Hive

To use Hive in Flutter, we need to add the following dependencies to the pubspec.yaml file:

dependencies:

  hive: ^2.2.3

  hive_flutter: ^1.1.0

we also need to add hive_generator and build_runner to the dev dependencies:

dev_dependencies:

  hive_generator: ^2.0.0

  build_runner: ^2.3.3

Next, we need to initialize Hive in the main() function of our Flutter application. We can do this by calling the Hive.initFlutter() method as shown below:

void main() async {

  await Hive.initFlutter();

  runApp(const MyApp());

}

## Step 2: Define Hive Type Adapters

Hive is a NoSQL database that stores data in key-value pairs. Where value can be of a different type such as int, string, list, or custom objects. To store custom objects in Hive, we need to define type adapters that tell Hive how to serialize and deserialize our objects. We can use the hive_generator package to generate type adapters for our custom objects automatically.

It's a simple model class, which is compatible with Hive 

import 'package:hive/hive.dart';
part 'animal_model.g.dart';

@HiveType(typeId: 0)

class AnimalModel {

  @HiveField(0)

  final String name;

  @HiveField(1)

  final String age;

  @HiveField(2)

  final bool isMale;

  const AnimalModel(this.name, this.age, this.isMale);
}

## NOTE:

. Make sure you add this line in your model class before running the next step.

part 'your_model_class_file.g.dart';

. Annotate the model class with @HiveType(), so the generator knows this should be a TypeAdapter.

. Annotate each field you want to save with @HiveField(index), the index is an int and each index should appear once and you shouldn't change it after registering them.

. In case you change the field name or its datatype or add a new field — You have to run the type adapter command again and re-run the app to reflect the changes in the app.

We can then generate the type adapters for this class by running the following command in the terminal:

=> flutter packages pub run build_runner build

This will generate a animal_model.g.dart file that contains the type adapter for our AnimalModel class.

Finally, register the type adapter in your main function, just add it beneath your hive initialization.

void main() async {

  await Hive.initFlutter();

  Hive.registerAdapter(AnimalModelAdapter());

  runApp(const MyApp());
}

## Step 3: Storing Data in Hive
To store data in Hive, we need to open a Hive box. A box is similar to a table in a traditional SQL database and stores key-value pairs. We can open a box by calling the Hive.openBox() method and passing in the name of the box as a parameter. For example, we can open a box named animals as shown below:

Hive.openBox<AnimalModel>('animals');

We can open the same box multiple times, returning us the same box instance. However, it is good practice to open it once on app launch and get the box whenever we want to add/update/delete data from it. To get the animal box, we can do the following:

Box<AnimalModel> box = Hive.box<AnimalModel>('animals');

And there are 2 ways to add data

. box.add(value) - just gives each value an index and auto increments it.

. box.put('key', value) - you have to specify the key for each value

For example:  
var value = AnimalModel('cat', 8 , false); //creating object
await box.put(value.name, value); //putting object into hive box

## Step 4: Reading Data from Hive
There are different ways to read data from your boxes:

. box.get('key) - get the value from a key.

. box.getAt(index) - get the value from an index created with box.add().

. box.values - this returns an iterable containing all the items in the box.

For example:

AnimalModel? value = box.get('cat'); //get by key
AnimalModel? value = box.getAt(0); //get by index
List<AnimalModel>? list = box.values.toList(); //get all items in list

## Step 5: Updating Data in Hive
There are two ways to update the value

. box.put('key', newValue) to update that value.

. box.putAt(index, item) which works like getAt().

For example:

var value = AnimalModel('dog', 8, true); //creating new object 
await box.put(value.name, value); //putting object into hive box

## Step 6: Deleting Data from Hive
Deleting items is similar to getting:

. box.delete('key) - delete by key

. box.deleteAt(index) - delete by index

. box.deleteAll(keys) - accepts an iterable of keys, and deletes all the keys given.

For example:

await box.delete('cat'); //delete cat with key name 'cat'.

## Finally
we have explored how to set up and use Hive in Flutter, including defining Hive type adapters, and storing, reading, updating, and deleting data from Hive. By using Hive in our Flutter applications, we can easily store and retrieve data without the overhead of traditional SQL databases.
