/****************************************************************************
** Meta object code from reading C++ file 'CxxView.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.2.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/nc/gui/CxxView.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'CxxView.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.2.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_nc__gui__CxxView_t {
    QByteArrayData data[25];
    char stringdata[421];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_nc__gui__CxxView_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_nc__gui__CxxView_t qt_meta_stringdata_nc__gui__CxxView = {
    {
QT_MOC_LITERAL(0, 0, 16),
QT_MOC_LITERAL(1, 17, 20),
QT_MOC_LITERAL(2, 38, 0),
QT_MOC_LITERAL(3, 39, 27),
QT_MOC_LITERAL(4, 67, 25),
QT_MOC_LITERAL(5, 93, 20),
QT_MOC_LITERAL(6, 114, 11),
QT_MOC_LITERAL(7, 126, 12),
QT_MOC_LITERAL(8, 139, 8),
QT_MOC_LITERAL(9, 148, 14),
QT_MOC_LITERAL(10, 163, 41),
QT_MOC_LITERAL(11, 205, 5),
QT_MOC_LITERAL(12, 211, 13),
QT_MOC_LITERAL(13, 225, 21),
QT_MOC_LITERAL(14, 247, 43),
QT_MOC_LITERAL(15, 291, 12),
QT_MOC_LITERAL(16, 304, 15),
QT_MOC_LITERAL(17, 320, 19),
QT_MOC_LITERAL(18, 340, 15),
QT_MOC_LITERAL(19, 356, 14),
QT_MOC_LITERAL(20, 371, 9),
QT_MOC_LITERAL(21, 381, 6),
QT_MOC_LITERAL(22, 388, 19),
QT_MOC_LITERAL(23, 408, 6),
QT_MOC_LITERAL(24, 415, 4)
    },
    "nc::gui::CxxView\0nodeSelectionChanged\0"
    "\0instructionSelectionChanged\0"
    "statementSelectionChanged\0"
    "termSelectionChanged\0setDocument\0"
    "CxxDocument*\0document\0highlightNodes\0"
    "std::vector<const core::likec::TreeNode*>\0"
    "nodes\0ensureVisible\0highlightInstructions\0"
    "std::vector<const core::arch::Instruction*>\0"
    "instructions\0updateSelection\0"
    "highlightReferences\0gotoDeclaration\0"
    "gotoDefinition\0gotoLabel\0rename\0"
    "populateContextMenu\0QMenu*\0menu\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_nc__gui__CxxView[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      16,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   94,    2, 0x06,
       3,    0,   95,    2, 0x06,
       4,    0,   96,    2, 0x06,
       5,    0,   97,    2, 0x06,

 // slots: name, argc, parameters, tag, flags
       6,    1,   98,    2, 0x0a,
       9,    2,  101,    2, 0x0a,
       9,    1,  106,    2, 0x2a,
      13,    2,  109,    2, 0x0a,
      13,    1,  114,    2, 0x2a,
      16,    0,  117,    2, 0x08,
      17,    0,  118,    2, 0x08,
      18,    0,  119,    2, 0x08,
      19,    0,  120,    2, 0x08,
      20,    0,  121,    2, 0x08,
      21,    0,  122,    2, 0x08,
      22,    1,  123,    2, 0x08,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 7,    8,
    QMetaType::Void, 0x80000000 | 10, QMetaType::Bool,   11,   12,
    QMetaType::Void, 0x80000000 | 10,   11,
    QMetaType::Void, 0x80000000 | 14, QMetaType::Bool,   15,   12,
    QMetaType::Void, 0x80000000 | 14,   15,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 23,   24,

       0        // eod
};

void nc::gui::CxxView::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        CxxView *_t = static_cast<CxxView *>(_o);
        switch (_id) {
        case 0: _t->nodeSelectionChanged(); break;
        case 1: _t->instructionSelectionChanged(); break;
        case 2: _t->statementSelectionChanged(); break;
        case 3: _t->termSelectionChanged(); break;
        case 4: _t->setDocument((*reinterpret_cast< CxxDocument*(*)>(_a[1]))); break;
        case 5: _t->highlightNodes((*reinterpret_cast< const std::vector<const core::likec::TreeNode*>(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 6: _t->highlightNodes((*reinterpret_cast< const std::vector<const core::likec::TreeNode*>(*)>(_a[1]))); break;
        case 7: _t->highlightInstructions((*reinterpret_cast< const std::vector<const core::arch::Instruction*>(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 8: _t->highlightInstructions((*reinterpret_cast< const std::vector<const core::arch::Instruction*>(*)>(_a[1]))); break;
        case 9: _t->updateSelection(); break;
        case 10: _t->highlightReferences(); break;
        case 11: _t->gotoDeclaration(); break;
        case 12: _t->gotoDefinition(); break;
        case 13: _t->gotoLabel(); break;
        case 14: _t->rename(); break;
        case 15: _t->populateContextMenu((*reinterpret_cast< QMenu*(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (CxxView::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&CxxView::nodeSelectionChanged)) {
                *result = 0;
            }
        }
        {
            typedef void (CxxView::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&CxxView::instructionSelectionChanged)) {
                *result = 1;
            }
        }
        {
            typedef void (CxxView::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&CxxView::statementSelectionChanged)) {
                *result = 2;
            }
        }
        {
            typedef void (CxxView::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&CxxView::termSelectionChanged)) {
                *result = 3;
            }
        }
    }
}

const QMetaObject nc::gui::CxxView::staticMetaObject = {
    { &TextView::staticMetaObject, qt_meta_stringdata_nc__gui__CxxView.data,
      qt_meta_data_nc__gui__CxxView,  qt_static_metacall, 0, 0}
};


const QMetaObject *nc::gui::CxxView::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *nc::gui::CxxView::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_nc__gui__CxxView.stringdata))
        return static_cast<void*>(const_cast< CxxView*>(this));
    return TextView::qt_metacast(_clname);
}

int nc::gui::CxxView::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TextView::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 16)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 16;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 16)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 16;
    }
    return _id;
}

// SIGNAL 0
void nc::gui::CxxView::nodeSelectionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void nc::gui::CxxView::instructionSelectionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void nc::gui::CxxView::statementSelectionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void nc::gui::CxxView::termSelectionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}
QT_END_MOC_NAMESPACE
