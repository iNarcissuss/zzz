/****************************************************************************
** Meta object code from reading C++ file 'TreeView.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.2.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/nc/gui/TreeView.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'TreeView.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.2.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_nc__gui__TreeView_t {
    QByteArrayData data[15];
    char stringdata[149];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_nc__gui__TreeView_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_nc__gui__TreeView_t qt_meta_stringdata_nc__gui__TreeView = {
    {
QT_MOC_LITERAL(0, 0, 17),
QT_MOC_LITERAL(1, 18, 18),
QT_MOC_LITERAL(2, 37, 0),
QT_MOC_LITERAL(3, 38, 6),
QT_MOC_LITERAL(4, 45, 4),
QT_MOC_LITERAL(5, 50, 4),
QT_MOC_LITERAL(6, 55, 6),
QT_MOC_LITERAL(7, 62, 5),
QT_MOC_LITERAL(8, 68, 7),
QT_MOC_LITERAL(9, 76, 15),
QT_MOC_LITERAL(10, 92, 4),
QT_MOC_LITERAL(11, 97, 10),
QT_MOC_LITERAL(12, 108, 15),
QT_MOC_LITERAL(13, 124, 3),
QT_MOC_LITERAL(14, 128, 19)
    },
    "nc::gui::TreeView\0contextMenuCreated\0"
    "\0QMenu*\0menu\0copy\0zoomIn\0delta\0zoomOut\0"
    "setDocumentFont\0font\0selectFont\0"
    "showContextMenu\0pos\0populateContextMenu\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_nc__gui__TreeView[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   64,    2, 0x06,

 // slots: name, argc, parameters, tag, flags
       5,    0,   67,    2, 0x0a,
       6,    1,   68,    2, 0x0a,
       6,    0,   71,    2, 0x2a,
       8,    1,   72,    2, 0x0a,
       8,    0,   75,    2, 0x2a,
       9,    1,   76,    2, 0x0a,
      11,    0,   79,    2, 0x0a,
      12,    1,   80,    2, 0x08,
      14,    1,   83,    2, 0x08,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    7,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    7,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QFont,   10,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QPoint,   13,
    QMetaType::Void, 0x80000000 | 3,    4,

       0        // eod
};

void nc::gui::TreeView::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        TreeView *_t = static_cast<TreeView *>(_o);
        switch (_id) {
        case 0: _t->contextMenuCreated((*reinterpret_cast< QMenu*(*)>(_a[1]))); break;
        case 1: _t->copy(); break;
        case 2: _t->zoomIn((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->zoomIn(); break;
        case 4: _t->zoomOut((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: _t->zoomOut(); break;
        case 6: _t->setDocumentFont((*reinterpret_cast< const QFont(*)>(_a[1]))); break;
        case 7: _t->selectFont(); break;
        case 8: _t->showContextMenu((*reinterpret_cast< const QPoint(*)>(_a[1]))); break;
        case 9: _t->populateContextMenu((*reinterpret_cast< QMenu*(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (TreeView::*_t)(QMenu * );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&TreeView::contextMenuCreated)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject nc::gui::TreeView::staticMetaObject = {
    { &QDockWidget::staticMetaObject, qt_meta_stringdata_nc__gui__TreeView.data,
      qt_meta_data_nc__gui__TreeView,  qt_static_metacall, 0, 0}
};


const QMetaObject *nc::gui::TreeView::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *nc::gui::TreeView::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_nc__gui__TreeView.stringdata))
        return static_cast<void*>(const_cast< TreeView*>(this));
    return QDockWidget::qt_metacast(_clname);
}

int nc::gui::TreeView::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDockWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 10)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 10;
    }
    return _id;
}

// SIGNAL 0
void nc::gui::TreeView::contextMenuCreated(QMenu * _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
