import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/bloc/home.bloc.dart';
import 'package:todo_list/views/home_page.dart';

void main() {
  runApp(TodoList());
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [
          Bloc((i) => HomeBloc(), singleton: true),          
        ], //Injeção de dependências Bloc
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.teal),
          home: HomePage(),
        ));
  }
}
