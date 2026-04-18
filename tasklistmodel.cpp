#include "tasklistmodel.h"

TaskListModel::TaskListModel(QObject* parent) :
    _tasks( {} ){}

int TaskListModel::rowCount(const QModelIndex& index) const {
    return _tasks.size();
}

QVariant TaskListModel::data(const QModelIndex& index, int role) const {
    if(!index.isValid() || index.row() >= _tasks.size()) {
        return {};
    }

    const TaskModel* task = _tasks.at(index.row());

    switch (role) {
    case DsTaskRole:
        return task->dsTask();
        break;
    case IsDoneRole:
        return task->isDone();
    default:
        break;
    }

    return {};
}

QHash<int, QByteArray> TaskListModel::roleNames() const {
    return {
        { DsTaskRole, "dsTask"},
        { IsDoneRole, "isDone"}
    };
}
