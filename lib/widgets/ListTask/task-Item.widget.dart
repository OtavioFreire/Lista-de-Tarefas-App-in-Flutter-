import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/bloc/home.bloc.dart';
import 'package:todo_list/helpers/priorityColor.dart';

class TaskItem extends StatefulWidget {
  final int _index;
  TaskItem(this._index);
  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    _homeBloc = BlocProvider.getBloc<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _homeBloc.outCheck,
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        bool _value = _homeBloc.tasks[widget._index].isDone;
        if (snapshot.hasData) {
          _value = snapshot.data["id"] == _homeBloc.tasks[widget._index].id
              ? (snapshot.data["isDone"] != 0)
              : _value;
        }
        return CheckboxListTile(         
          secondary: Container(
            width: 10,
            color:PriorityColor.priority(_homeBloc.tasks[widget._index].priority)??Colors.white,
          ),
          value: _value,
          title: Text(_homeBloc.tasks[widget._index].title),
          subtitle: Text(_homeBloc.tasks[widget._index].description),
          onChanged: (bool isChecked) {
            _homeBloc.check(widget._index);
          },
        );
      },
    );
  }
}
