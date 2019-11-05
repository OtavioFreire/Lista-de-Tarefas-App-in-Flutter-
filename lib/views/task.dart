import 'package:flutter/material.dart';
import 'package:todo_list/bloc/task.bloc.dart';
import 'package:todo_list/helpers/priorityColor.dart';
import 'package:todo_list/helpers/validator.dart';

class TaskDialog extends StatefulWidget {
  int _index;
  TaskDialog({int index}) {
    this._index = index;
  }

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String __dropdownButtonValue;
  TaskDialogBloc _taskBloc;
  List<DropdownMenuItem<String>> _list;
  GlobalKey<FormState> _keyFormTask;

  @override
  void initState() {
    _taskBloc = TaskDialogBloc();
    _taskBloc.setTask(widget._index);
    _keyFormTask = GlobalKey<FormState>();
    _list = List<DropdownMenuItem<String>>();

    _list.add(_itemDropdown(
      valor: "Alta",
      description: "Alta",
      cor: PriorityColor.priority("Alta"),
    ));

    _list.add(_itemDropdown(
        valor: "Média-Alta",
        description: "Média-Alta",
        cor: PriorityColor.priority("Média-Alta")));

    _list.add(_itemDropdown(
        valor: "Média",
        description: "Média",
        cor: PriorityColor.priority("Média")));

    _list.add(_itemDropdown(
        valor: "Média-Baixa",
        description: "Média-Baixa",
        cor: PriorityColor.priority("Média-Baixa")));

    _list.add(_itemDropdown(
        valor: "Baixa",
        description: "Baixa",
        cor: PriorityColor.priority("Baixa")));

    if (_taskBloc.getTask != null) {
      _titleController.text = _taskBloc.getTask.title;
      _descriptionController.text = _taskBloc.getTask.description;
      __dropdownButtonValue = _taskBloc.getTask.priority;
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(_taskBloc.getTask == null ? 'Nova tarefa' : 'Editar tarefa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: _formTask()),
      ),
    );
  }

  Widget _formTask() {
    return Form(
      key: _keyFormTask,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
              autofocus: true,
              validator: (value) {
                return Validator.validatorString(value)
                    ? "Campo obrigatório"
                    : null;
              }),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  return Validator.validatorString(value)
                      ? "Campo obrigatório"
                      : null;
                }),
          ),
          SizedBox(
            height: 20,
          ),
          _dropdownButton(_list),
          SizedBox(
            height: 60,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Theme.of(context).colorScheme.primary,
            ),
            width: MediaQuery.of(context).size.width,
            child: FlatButton(
              child: Text(
                'Salvar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: () {
                if (_keyFormTask.currentState.validate()) {
                  _taskBloc
                      .salvarTask(
                          descricao: _descriptionController.text,
                          titulo: _titleController.text,
                          priority: __dropdownButtonValue)
                      .then(
                    (valor) {
                      if (valor) Navigator.of(context).pop();
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _dropdownButton(List<DropdownMenuItem<String>> list) {    
    return StreamBuilder(
      stream: _taskBloc.outDropDown,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        __dropdownButtonValue = snapshot.hasData ? snapshot.data : __dropdownButtonValue;
        return DropdownButton<String>(
            hint: Text("Prioridade"),            
            isExpanded: true,            
            value: __dropdownButtonValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 20,
            onChanged: (string) {
              __dropdownButtonValue = string;
              _taskBloc.changeDropDown(string);
            },
            items: list);
      },
    );
  }

  Widget _itemDropdown({String valor, String description, Color cor}) {
    return DropdownMenuItem<String>(
      value: valor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 15,
            width: 15,
            child: Container(
              color: cor,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(description)
        ],
      ),
    );
  }
}
