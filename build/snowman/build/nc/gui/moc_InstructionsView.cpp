/****************************************************************************
** Meta object code from reading C++ file 'InstructionsView.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.2.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/nc/gui/InstructionsView.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'InstructionsView.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.2.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_nc__gui__InstructionsView_t {
    QByteArrayData data[10];
    char stringdata[222];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_nc__gui__InstructionsView_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_nc__gui__InstructionsView_t qt_meta_stringdata_nc__gui__InstructionsView = {
    {
QT_MOC_LITERAL(0, 0, 25),
QT_MOC_LITERAL(1, 26, 27),
QT_MOC_LITERAL(2, 54, 0),
QT_MOC_LITERAL(3, 55, 26),
QT_MOC_LITERAL(4, 82, 29),
QT_MOC_LITERAL(5, 112, 21),
QT_MOC_LITERAL(6, 134, 43),
QT_MOC_LITERAL(7, 178, 12),
QT_MOC_LITERAL(8, 191, 13),
QT_MOC_LITERAL(9, 205, 15)
    },
    "nc::gui::InstructionsView\0"
    "instructionSelectionChanged\0\0"
    "deleteSelectedInstructions\0"
    "decompileSelectedInstructions\0"
    "highlightInstructions\0"
    "std::vector<const core::arch::Instruction*>\0"
    "instructions\0ensureVisible\0updateSelection\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_nc__gui__InstructionsView[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x06,
       3,    0,   45,    2, 0x06,
       4,    0,   46,    2, 0x06,

 // slots: name, argc, parameters, tag, flags
       5,    2,   47,    2, 0x0a,
       5,    1,   52,    2, 0x2a,
       9,    0,   55,    2, 0x08,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 6, QMetaType::Bool,    7,    8,
    QMetaType::Void, 0x80000000 | 6,    7,
    QMetaType::Void,

       0        // eod
};

void nc::gui::InstructionsView::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        InstructionsView *_t = static_cast<InstructionsView *>(_o);
        switch (_id) {
        case 0: _t->instructionSelectionChanged(); break;
        case 1: _t->deleteSelectedInstructions(); break;
        case 2: _t->decompileSelectedInstructions(); break;
        case 3: _t->highlightInstructions((*reinterpret_cast< const std::vector<const core::arch::Instruction*>(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 4: _t->highlightInstructions((*reinterpret_cast< const std::vector<const core::arch::Instruction*>(*)>(_a[1]))); break;
        case 5: _t->updateSelection(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (InstructionsView::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&InstructionsView::instructionSelectionChanged)) {
                *result = 0;
            }
        }
        {
            typedef void (InstructionsView::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&InstructionsView::deleteSelectedInstructions)) {
                *result = 1;
            }
        }
        {
            typedef void (InstructionsView::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&InstructionsView::decompileSelectedInstructions)) {
                *result = 2;
            }
        }
    }
}

const QMetaObject nc::gui::InstructionsView::staticMetaObject = {
    { &TreeView::staticMetaObject, qt_meta_stringdata_nc__gui__InstructionsView.data,
      qt_meta_data_nc__gui__InstructionsView,  qt_static_metacall, 0, 0}
};


const QMetaObject *nc::gui::InstructionsView::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *nc::gui::InstructionsView::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_nc__gui__InstructionsView.stringdata))
        return static_cast<void*>(const_cast< InstructionsView*>(this));
    return TreeView::qt_metacast(_clname);
}

int nc::gui::InstructionsView::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TreeView::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void nc::gui::InstructionsView::instructionSelectionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void nc::gui::InstructionsView::deleteSelectedInstructions()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void nc::gui::InstructionsView::decompileSelectedInstructions()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}
QT_END_MOC_NAMESPACE
