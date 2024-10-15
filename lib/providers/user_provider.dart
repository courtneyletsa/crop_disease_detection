import 'package:flutter/material.dart';
import 'package:random_person_data/random_person_data.dart';

class UserProvider extends ChangeNotifier {
  late RandomPersonData? randomPersonData;

  bool hasUser() {
    return randomPersonData != null;
  }

  void rebuild() => Future.delayed(Duration.zero, () => notifyListeners());

  String getUserName() => '${randomPersonData!.name!.first!} ${randomPersonData!.name!.last!}';

  Future<void> initRandomUser() async {
    randomPersonData = await fetchRandomPerson();
    rebuild();
  }

  Future<RandomPersonData?> fetchRandomPerson() async {
    final randomPerson = RandomPerson();
    try {
      List<RandomPersonData> persons = await randomPerson.get(results: 1);
      return persons.first;
    } catch (e) {
      debugPrint('Error fetching data: $e');
      return null;
    }
  }
}
