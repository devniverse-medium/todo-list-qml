---

## Arquitetura

O projeto segue o padrão **MVC (Model-View-Controller)** nativo do Qt, onde o QML atua como View, o `TaskListModel` como Model, e o `MainScreenControl` como Controller.

```
QML (View)
    ↕ property / Q_INVOKABLE
MainScreenControl (Controller)
    └── TaskListModel (Model)
            └── QList<TaskModel> (dados)
```

---

## Classes

### `TaskModel`
Classe que define a estrutura de uma tarefa. Representa a unidade de dado da aplicação, contendo o texto descritivo da tarefa e seu estado de conclusão. Não herda `QObject`, o que permite que seja armazenada por valor em um `QList`.

**Atributos:**
- `_dsTask` — texto descritivo da tarefa
- `_isDone` — estado de conclusão da tarefa

---

### `TaskListModel`
Classe que gerencia a coleção de tarefas. Herda `QAbstractListModel`, o que permite que o Qt gerencie automaticamente a comunicação entre os dados e o `ListView` no QML. É responsável por notificar a interface sempre que itens são adicionados, removidos ou alterados.

**Métodos principais:**
- `rowCount()` — retorna o número total de tarefas
- `data()` — retorna os dados de uma tarefa para o QML dado um índice e um role
- `roleNames()` — mapeia os roles (`dsTask`, `isDone`) para o QML
- `addTask()` — adiciona uma nova tarefa e notifica a view via `beginInsertRows`/`endInsertRows`
- `removeTask()` — remove uma tarefa e notifica a view via `beginRemoveRows`/`endRemoveRows`
- `toggleDone()` — alterna o estado de conclusão e notifica a view via `dataChanged`

**Roles expostos ao QML:**
- `DsTaskRole` → `"dsTask"`
- `IsDoneRole` → `"isDone"`

---

### `MainScreenControl`
Classe que faz a ponte entre o QML e o `TaskListModel`. É registrada no contexto QML e expõe o model e os métodos de manipulação de tarefas para a interface. Toda a lógica de negócio passa por ela, mantendo o QML desacoplado do model.

**Propriedades expostas ao QML:**
- `tasks` — retorna o ponteiro para o `TaskListModel`

**Métodos expostos ao QML via `Q_INVOKABLE`:**
- `addTask(dsTask)` — solicita a adição de uma nova tarefa
- `deleteTask(index)` — solicita a remoção de uma tarefa pelo índice
- `doneTask(index)` — solicita a alternância do estado de conclusão de uma tarefa

---

## Fluxo de uma operação

Exemplo do fluxo ao adicionar uma tarefa:

1. Usuário digita o texto e clica no botão `+` no QML
2. O QML chama `control.addTask(textField.text)`
3. O `MainScreenControl` delega para `_tasks->addTask(dsTask)`
4. O `TaskListModel` chama `beginInsertRows`, insere o item na lista e chama `endInsertRows`
5. O Qt notifica o `ListView` automaticamente, que atualiza a interface

---

## Tecnologias

- **Qt 6.10.1**
- **QML** — interface declarativa
- **QAbstractListModel** — gerenciamento do model da lista
- **C++ 17** — lógica de negócio e model
