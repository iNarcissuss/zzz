/****************************************************************************
** Meta object code from reading C++ file 'InspectorView.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.2.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/nc/gui/InspectorView.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'InspectorView.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.2.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_nc__gui__InspectorView_t {
    QByteArrayData data[11];
    char stringdata[184];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_nc__gui__InspectorView_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_nc__gui__InspectorView_t qt_meta_stringdata_nc__gui__InspectorView = {
    {
QT_MOC_LITERAL(0, 0, 22),
QT_MOC_LITERAL(1, 23, 20),
QT_MOC_LITERAL(2, 44, 0),
QT_MOC_LITERAL(3, 45, 27),
QT_MOC_LITERAL(4, 73, 8),
QT_MOC_LITERAL(5, 82, 15),
QT_MOC_LITERAL(6, 98, 5),
QT_MOC_LITERAL(7, 104, 14),
QT_MOC_LITERAL(8, 119, 41),
QT_MOC_LITERAL(9, 161, 5),
QT_MOC_LITERAL(10, 167, 15)
    },
    "nc::gui::InspectorView\0nodeSelectionChanged\0"
    "\0instructionSelectionChanged\0setModel\0"
    "InspectorModel*\0model\0highlightNodes\0"
    "std::vector<const core::likec::TreeNode*>\0"
    "nodes\0updateSelection\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_nc__gui__InspectorView[] = {

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
       4,    1,   41,    2, 0x0a,
       7,    1,   44,    2, 0x0a,
      10,    0,   47,    2, 0x08,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 5,    6,
    QMetaType::Void, 0x80000000 | 8,    9,
    QMetaType::Void,

       0        // eod
};

void nc::gui::InspectorView::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        InspectorView *_t = static_cast<InspectorView *>(_o);
        switch (_id) {
        case 0: _t->nodeSelectionChanged(); break;
        case 1: _t->instructionSelectionChanged(); break;
        case 2: _t->setModel((*reinterpret_cast< InspectorModel*(*)>(_a[1]))); break;
        case 3: _t->highlightNodes((*reinterpret_cast< const std::vector<const core::likec::TreeNode*>(*)>(_a[1]))); break;
        case 4: _t->updateSelection(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (InspectorView::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&InspectorView::nodeSelectionChanged)) {
                *result = 0;
            }
        }
        {
            typedef void (InspectorView::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&InspectorView::instructionSelectionChanged)) {
                *result = 1;
            }
        }
    }
}

const QMetaObject nc::gui::InspectorView::staticMetaObject = {
    { &QDockWidget::staticMetaObject, qt_meta_stringdata_nc__gui__InspectorView.data,
      qt_meta_data_nc__gui__InspectorView,  qt_static_metacall, 0, 0}
};


const QMetaObject *nc::gui::InspectorView::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *nc::gui::InspectorView::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_nc__gui__InspectorView.stringdata))
        return static_cast<void*>(const_cast< InspectorView*>(this));
    return QDockWidget::qt_metacast(_clname);
}

int nc::gui::InspectorView::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDockWidget::qt_metacall(_c, _id, _a);
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
void nc::gui::InspectorView::nodeSelectionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void nc::gui::InspectorView::instructionSelectionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}
QT_END_MOC_NAMESPACE
