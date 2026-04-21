#include "mainscreencontrol.h"
#include <QDebug>

MainScreenControl::MainScreenControl(QObject* parent) :
    QObject(parent),
    _tasks(new TaskListModel(this)){}

TaskListModel* MainScreenControl::tasks() const {
    return _tasks;
}

void MainScreenControl::addTask(const QString& dsTask) {
    _tasks->addTask(dsTask);
}

void MainScreenControl::deleteTask(const int index) {
    _tasks->removeTask(index);
}

void MainScreenControl::doneTask(const int index) {
    _tasks->doneTask(index);
}
