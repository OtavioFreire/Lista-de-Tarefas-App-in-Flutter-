import 'package:todo_list/dao/todolist.dao.dart';
import 'package:todo_list/models/task.dart';

class TodoListRepository{

final todoDao = TodoListDao(); 
 
Future<List<Task>> getAll() => todoDao.getAll();
Future<int> update(Task task) => todoDao.update(task);
Future<int> delete(int id) => todoDao.delete(id);
Future<Task> insert(Task task) => todoDao.insert(task);  
}