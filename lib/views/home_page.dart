import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/bloc/home.bloc.dart';
import 'package:todo_list/views/task.dart';
import 'package:todo_list/widgets/ListTask/task-List.widget.dart';

class HomePage extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    final _homeBloc = BlocProvider.getBloc<HomeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        actions: <Widget>[
          Container(
            width: 60,
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: StreamBuilder(
                  initialData: 0.0,
                  stream: _homeBloc.outProgress,
                  builder: (context, AsyncSnapshot<double> snapshot) {                   
                    return Stack(
                      children: <Widget>[
                        CircularProgressIndicator(
                          value: snapshot.data/100,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.orange),
                          backgroundColor: Colors.white,
                          strokeWidth: 3.5,
                        ),
                        Center(
                          child: Text(
                            (snapshot.data).ceil().toString(),                            
                            style: TextStyle(
                                fontSize: 12, color: Colors.orange[600]),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => TaskDialog()),
          );
          // showDialog(
          //     barrierDismissible: false,
          //    context: context,
          //    builder: (BuildContext context) {
          //        return TaskDialog();
          //     });
        },
      ),
      body: TaskList(),
    );
  }
}
