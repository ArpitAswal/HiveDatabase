
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

/*
. Annotate the model class with @HiveType(), so the generator knows this should be a TypeAdapter.
. Annotate each field you want to save with @HiveField(index), the index is an int and each index should appear once and you shouldn't change it after registering them.
. In case you change the field name or its datatype or add a new field. You have to run the type adapter command again and re-run the app to reflect the changes in the app.
 */