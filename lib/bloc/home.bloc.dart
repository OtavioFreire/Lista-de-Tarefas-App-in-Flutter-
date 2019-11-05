import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/repositories/todolist.repository.dart';

//para utilizar o bloc_patter a classe deve implementar o Blocbase conforme a documentação
class HomeBloc extends BlocBase {
  List<Task> _tasks = [];
  bool _loading = true;
  final TodoListRepository _todoLisRepository = TodoListRepository();  

  HomeBloc() {
    _todoLisRepository.getAll().then((data) {
      _tasks = data;
      _loading = false;
      inputTask.add(_tasks);
      inputProgress.add(_countProgress());
    });
  }

  List<Task> get tasks => _tasks;
  bool get loading => _loading;

//fluxo Lista de Tarefas
  StreamController<List<Task>> _controllerTaskList = StreamController<List<Task>>.broadcast();
  StreamController<Task> _controllerCheckbox = StreamController<Task>.broadcast();
  StreamController<double> _controllerProgress = StreamController<double>();

  Sink<List<Task>> get inputTask => _controllerTaskList.sink;
  Stream<List<Task>> get outputTask => _controllerTaskList.stream;
  //Stream<double> get outprogress => _controllerTaskList.stream.map(countProgress);

  Sink<Task> get inputCheck => _controllerCheckbox.sink;
  Stream<Map<String, dynamic>> get outCheck => _controllerCheckbox.stream.map((task) { return task.toMap(); });

  Sink<double> get inputProgress => _controllerProgress.sink;
  Stream<double> get outProgress => _controllerProgress.stream;


  insertTaskList(Task task) {
    _tasks.add(task);
    inputTask.add(_tasks);
    inputProgress.add(_countProgress());
  }

  void updateTaskList(Task task, int index) {
    _tasks[index] = task;
    inputTask.add(_tasks);
    inputProgress.add(_countProgress());
  }

  Future check(int index) async {
    _tasks[index].isDone = !_tasks[index].isDone;
    await _todoLisRepository.update(_tasks[index]);
    inputCheck.add(_tasks[index]);
    inputProgress.add(_countProgress());
  }

  double _countProgress(){
    int _isDone = 0;
    _tasks.forEach((t){
    _isDone= t.isDone? _isDone+1 : _isDone;
    });
     
    return (tasks.length > 0)?(_isDone*100)/tasks.length:0.0;
  }

  Future deletetask(int index) async {    
    await _todoLisRepository.delete(_tasks[index].id).then((r){
      _tasks.removeAt(index);
      inputTask.add(_tasks);
     inputProgress.add(_countProgress());    

    });
  }


  @override
  void dispose() {
    _controllerCheckbox.close();
    _controllerTaskList.close();
    _controllerProgress.close();
    super.dispose();
  }
}
