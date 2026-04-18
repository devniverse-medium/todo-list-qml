#ifndef TASKLISTMODEL_H
#define TASKLISTMODEL_H

#include "taskmodel.h"
#include <QAbstractListModel>

class TaskListModel : QAbstractListModel {
    Q_OBJECT

  public:
    explicit TaskListModel(QObject* parent = nullptr);

    enum Roles {
        DsTaskRole = Qt::UserRole + 1,
        IsDoneRole
    };

    int rowCount(const QModelIndex& index) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

  private:
    QList<TaskModel*> _tasks;
};

#endif // TASKLISTMODEL_H
