#ifndef MAINSCREENCONTROL_H
#define MAINSCREENCONTROL_H

#include <QObject>

class MainScreenControl : public QObject {
    Q_OBJECT
  public:
    Q_INVOKABLE void test();
};

#endif // MAINSCREENCONTROL_H
