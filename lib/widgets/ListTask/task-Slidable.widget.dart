import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/bloc/home.bloc.dart';
import 'package:todo_list/views/task.dart';
import 'package:todo_list/widgets/ListTask/task-Item.widget.dart';


Widget slidableBuild(BuildContext context, int index) {
  final _homeBloc = BlocProvider.getBloc<HomeBloc>();

  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    closeOnScroll: true,    
    actionExtentRatio: 0.25,        
    child: TaskItem(index),
    actions: <Widget>[
      IconSlideAction(
        caption: 'Editar',
        color: Colors.blue,
        icon: Icons.edit,
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> TaskDialog(index:index) ));},
      ),
      IconSlideAction(
        caption: 'Excluir',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {_homeBloc.deletetask(index);},
      ),
    ],
  );
}
