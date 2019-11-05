import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/bloc/home.bloc.dart';
import 'package:todo_list/widgets/ListTask/task-Slidable.widget.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    _homeBloc = BlocProvider.getBloc<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _homeBloc.outputTask,
      initialData: _homeBloc.tasks,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center( child: _homeBloc.loading
                ? CircularProgressIndicator()
                : Text("Sem tarefas!"),
          );
        } else {
          return listViewTask(snapshot);
        }
      },
    );
  }

  Widget listViewTask(AsyncSnapshot snapshot) {
    return ListView.separated(
      itemBuilder: slidableBuild,
      itemCount: snapshot.data.length,
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Divider(
            height: 1,
            color: Colors.grey[350],
          ),
        );
      },
    );
  }
}
