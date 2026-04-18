#include "taskmodel.h"

TaskModel::TaskModel() :
    _dsTask(""),
    _isDone(false) {}

QString TaskModel::dsTask() const {
    return _dsTask;
}

void TaskModel::setDsTask(const QString& dsTask) {
    _dsTask = dsTask;
}

bool TaskModel::isDone() const {
    return _isDone;
}

void TaskModel::setIsDone(const bool isDone) {
    _isDone = isDone;
}
