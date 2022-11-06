import 'package:get/get.dart';

class TodoController extends GetxController {
  var tasks = [].obs;
  var isChecked = [].obs;

  void additem(String title) {
    tasks.add(title);
    isChecked.add(false);
  }

  void deleteitem(int index) {
    tasks.removeAt(index);
    isChecked.removeAt(index);
  }

  void checkupdate(int index) {
    isChecked[index] = isChecked[index]!;
  }

  void edititem(value, index) {
    tasks[index] = value;
  }
}
