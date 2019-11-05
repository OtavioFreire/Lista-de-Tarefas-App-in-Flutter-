# Lista de Tarefas( Todo-List )

Aplicativo para gerenciar as tarefas do dia-a-dia criado para disciplina de Programação Mobile.

<p align="center">
<img src="https://bit.ly/2NCkm1i" width="210"/>    
<img src="https://bit.ly/32flH32" width="210"/>
<img src="https://bit.ly/33fBRuH" width="210"/>
<img src="https://bit.ly/2PHMpip" width="210"/>
</p>

## O que foi utilizado neste projeto?

- [x] **Bloc Patter** com  injeção de dependência
- [x] **Repository e DAO Pattern**
- [x] **SqlLite** - Banco de dados interno
- [x] **Bloc** - separação da regra de negocio da view
- [x] **Path_Provider** é uma extensão que ajuda a facilitar o caminho comum de armazenamento do dispositivo. Neste projeto será usado em conjunto com o Sqflite para armazenar o banco de dados no dispositivo
- [x] **Slidable** - lista deslizável com ações direcionais de slide

## Desafios

-  [x] Na lista de tarefas, adicionar divisões entre as linhas
-  [x] Adicionar validações no cadastro de uma atividade
-  [x] Campo descrição precisar aceitar múltiplas linhas
-  [x] Criar um campo para nível de prioridades que aceita valores entre 1 (baixa prioridade) e 5 (alta prioridade). Representar isso no card da forma como achar mais interessante.
-  [x] Adicionar um [PercentIndicator] circular na barra de navegação para indicar a porcentagem de tarefas concluídas


## Documentação de apoio

 - Documentação oficial Flutter : https://flutter.dev/docs
 - Bloc pattern e Dependency Injection : https://pub.dev/packages/bloc_pattern
 - Exemplo de TodoList : https://medium.com/@vaygeth/reactive-flutter-todo-app-using-bloc-design-pattern-b71e2434f692
 - Percent indicator : https://pub.dev/packages/percent_indicator
 - Slidable : https://pub.dev/packages/flutter_slidable


## Licença

    Copyright 2019 Kleber de Oliveira Andrade
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
