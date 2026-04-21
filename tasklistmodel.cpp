#include "tasklistmodel.h"

TaskListModel::TaskListModel(QObject* parent) :
    QAbstractListModel(parent),
    _tasks( {} ){}

int TaskListModel::rowCount(const QModelIndex& index) const {
    if(index.isValid()) {
        return 0;
    }
    return _tasks.size();
}

QVariant TaskListModel::data(const QModelIndex& index, int role) const {
    if(!index.isValid() || index.row() >= _tasks.size()) {
        return {};
    }

    const TaskModel task = _tasks.at(index.row());

    switch (role) {
    case DsTaskRole:
        return task.dsTask();
        break;
    case IsDoneRole:
        return task.isDone();
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

void TaskListModel::addTask(const QString& dsTask) {
    if (dsTask.trimmed().isEmpty()) {
        return;
    }

    TaskModel task;
    task.setDsTask(dsTask);

    beginInsertRows({}, _tasks.size(), _tasks.size());

    _tasks.append(task);

    endInsertRows();
}

void TaskListModel::removeTask(const int index) {
    if (index < 0 || index >= _tasks.size()) {
        return;
    }

    beginRemoveRows({}, index, index);

    _tasks.removeAt(index);

    endRemoveRows();
}

void TaskListModel::doneTask(const int index) {
    if (index < 0 || index >= _tasks.size()) {
        return;
    }

    _tasks[index].setIsDone(!_tasks[index].isDone());

    QModelIndex idx = createIndex(index, 0);
    emit dataChanged(idx, idx, { IsDoneRole });
}
