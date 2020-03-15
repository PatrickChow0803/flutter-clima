import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  var task2Result = task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration duration = Duration(seconds: 3);

  String result;

//  sleep(duration);

  await Future.delayed(duration, () {
    result = 'task 2 data';
    print('Task 2 completed');
  });

  return result;
}

void task3(Future<String> task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete');
  print(task2Data);
}
