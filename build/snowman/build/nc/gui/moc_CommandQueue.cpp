/****************************************************************************
** Meta object code from reading C++ file 'CommandQueue.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.2.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/nc/gui/CommandQueue.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'CommandQueue.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.2.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_nc__gui__CommandQueue_t {
    QByteArrayData data[7];
    char stringdata[70];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_nc__gui__CommandQueue_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_nc__gui__CommandQueue_t qt_meta_stringdata_nc__gui__CommandQueue = {
    {
QT_MOC_LITERAL(0, 0, 21),
QT_MOC_LITERAL(1, 22, 11),
QT_MOC_LITERAL(2, 34, 0),
QT_MOC_LITERAL(3, 35, 4),
QT_MOC_LITERAL(4, 40, 6),
QT_MOC_LITERAL(5, 47, 5),
QT_MOC_LITERAL(6, 53, 15)
    },
    "nc::gui::CommandQueue\0nextCommand\0\0"
    "idle\0cancel\0clear\0commandFinished\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_nc__gui__CommandQueue[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   39,    2, 0x06,
       3,    0,   40,    2, 0x06,

 // slots: name, argc, parameters, tag, flags
       4,    0,   41,    2, 0x0a,
       5,    0,   42,    2, 0x0a,
       6,    0,   43,    2, 0x08,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void nc::gui::CommandQueue::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        CommandQueue *_t = static_cast<CommandQueue *>(_o);
        switch (_id) {
        case 0: _t->nextCommand(); break;
        case 1: _t->idle(); break;
        case 2: _t->cancel(); break;
        case 3: _t->clear(); break;
        case 4: _t->commandFinished(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (CommandQueue::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&CommandQueue::nextCommand)) {
                *result = 0;
            }
        }
        {
            typedef void (CommandQueue::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&CommandQueue::idle)) {
                *result = 1;
            }
        }
    }
    Q_UNUSED(_a);
}

const QMetaObject nc::gui::CommandQueue::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_nc__gui__CommandQueue.data,
      qt_meta_data_nc__gui__CommandQueue,  qt_static_metacall, 0, 0}
};


const QMetaObject *nc::gui::CommandQueue::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *nc::gui::CommandQueue::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_nc__gui__CommandQueue.stringdata))
        return static_cast<void*>(const_cast< CommandQueue*>(this));
    return QObject::qt_metacast(_clname);
}

int nc::gui::CommandQueue::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}

// SIGNAL 0
void nc::gui::CommandQueue::nextCommand()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void nc::gui::CommandQueue::idle()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}
QT_END_MOC_NAMESPACE
