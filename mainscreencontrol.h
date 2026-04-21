#ifndef MAINSCREENCONTROL_H
#define MAINSCREENCONTROL_H

#include <QObject>
#include "tasklistmodel.h"

class MainScreenControl : public QObject {
    Q_OBJECT
    Q_PROPERTY(TaskListModel* tasks READ tasks NOTIFY tasksChanged)
  public:
    explicit MainScreenControl(QObject* parent = nullptr);

    Q_INVOKABLE TaskListModel* tasks() const;
    Q_INVOKABLE void addTask( const QString& dsTask);
    Q_INVOKABLE void deleteTask( const int index );
    Q_INVOKABLE void doneTask( const int index);
  signals:
    void tasksChanged();
  private:
    TaskListModel* _tasks;
};

#endif // MAINSCREENCONTROL_H
