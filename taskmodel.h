#ifndef TASKMODEL_H
#define TASKMODEL_H

#include <QString>

class TaskModel {
  public:
    TaskModel();

    QString dsTask() const;
    void setDsTask(const QString& dsTask);

    bool isDone() const;
    void setIsDone( const bool isDone);

  private:
    QString _dsTask;
    bool _isDone;
};

#endif // TASKMODEL_H
