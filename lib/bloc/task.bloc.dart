import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/repositories/todolist.repository.dart';

import 'home.bloc.dart';

class TaskDialogBloc extends BlocBase {
  Task _task;
  int _index;  
  bool editing = false;
  final _homeBloc = BlocProvider.getBloc<HomeBloc>();

  Task get getTask => _task;

  void setTask( int index) {
    this._index = index;
    if (index != null) {
      this._task = _homeBloc.tasks[index];
    } 
  }

  StreamController<String> _dropDownController = StreamController<String> ();
  Sink<String> get inputDropDown => _dropDownController.sink;
  Stream<String> get outDropDown => _dropDownController.stream;

@override
void dispose(){
  _dropDownController.close();
  super.dispose();
}

  void changeDropDown(String value){
    _task?.priority = value;    
    inputDropDown.add(value);
  }
  
  Future<bool> salvarTask({@required String descricao, @required String titulo, @required priority}) async {
    TodoListRepository repository = TodoListRepository();
    int _response;

    //Caso for uma inserção
    if (this._task == null) {
      _task =await repository.insert(Task(description: descricao, title: titulo, priority: priority));
      _homeBloc.insertTaskList(_task);
      return true;
    }

    //Caso for uma Edição
    else if (this._index != null) {
      _task.title = titulo;
      _task.description = descricao;
      _response = await repository.update(_task);

      if (_response == 1) {
        _homeBloc.updateTaskList(_task, _index);
        return true;
      } else
        return false;
    } else
      return false;
  }
}
