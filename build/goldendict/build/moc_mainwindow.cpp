/****************************************************************************
** Meta object code from reading C++ file 'mainwindow.hh'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../mainwindow.hh"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainwindow.hh' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ExpandableToolBar[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_ExpandableToolBar[] = {
    "ExpandableToolBar\0"
};

void ExpandableToolBar::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ExpandableToolBar::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ExpandableToolBar::staticMetaObject = {
    { &QToolBar::staticMetaObject, qt_meta_stringdata_ExpandableToolBar,
      qt_meta_data_ExpandableToolBar, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ExpandableToolBar::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ExpandableToolBar::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ExpandableToolBar::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ExpandableToolBar))
        return static_cast<void*>(const_cast< ExpandableToolBar*>(this));
    return QToolBar::qt_metacast(_clname);
}

int ExpandableToolBar::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QToolBar::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_MainWindow[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
     117,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      19,   12,   11,   11, 0x05,
      51,   48,   11,   11, 0x05,

 // slots: signature, parameters, type, tag, flags
      76,   11,   11,   11, 0x0a,
     123,  120,   11,   11, 0x0a,
     165,   11,   11,   11, 0x0a,
     189,  187,   11,   11, 0x0a,
     223,   12,   11,   11, 0x0a,
     243,   11,   11,   11, 0x08,
     264,   11,   11,   11, 0x08,
     290,   11,   11,   11, 0x08,
     311,   11,   11,   11, 0x08,
     342,  337,   11,   11, 0x08,
     386,  382,   11,   11, 0x08,
     425,   48,   11,   11, 0x08,
     453,   48,   11,   11, 0x08,
     486,   48,   11,   11, 0x08,
     521,  516,   11,   11, 0x08,
     561,  556,   11,   11, 0x08,
     590,   11,   11,   11, 0x08,
     602,   11,   11,   11, 0x08,
     625,   11,   11,   11, 0x08,
     643,   11,   11,   11, 0x08,
     658,   11,   11,   11, 0x08,
     674,   11,   11,   11, 0x08,
     692,   11,   11,   11, 0x08,
     710,   11,   11,   11, 0x08,
     725,   11,   11,   11, 0x08,
     757,   11,   11,   11, 0x08,
     773,   11,   11,   11, 0x08,
     795,  791,   11,   11, 0x08,
     820,   11,   11,   11, 0x08,
     834,   11,   11,   11, 0x08,
     851,  187,   11,   11, 0x08,
     886,  187,   11,   11, 0x08,
     918,   11,   11,   11, 0x08,
     943,   11,   11,   11, 0x08,
     960,  382,   11,   11, 0x08,
     993,  985,   11,   11, 0x08,
    1025, 1020,   11,   11, 0x08,
    1049,   11,   11,   11, 0x28,
    1061,   11,   11,   11, 0x08,
    1070,   11,   11,   11, 0x08,
    1080,   11,   11,   11, 0x08,
    1089,   11,   11,   11, 0x08,
    1105,   11,   11,   11, 0x08,
    1122,   11,   11,   11, 0x08,
    1140,   11,   11,   11, 0x08,
    1182, 1162,   11,   11, 0x08,
    1205,   11,   11,   11, 0x28,
    1224,   11,   11,   11, 0x08,
    1243,   11,   11,   11, 0x08,
    1261,   11,   11,   11, 0x08,
    1290,   11,   11,   11, 0x08,
    1343, 1321,   11,   11, 0x08,
    1395, 1380,   11,   11, 0x28,
    1424,   11,   11,   11, 0x28,
    1449,   11,   11,   11, 0x08,
    1461,   11,   11,   11, 0x08,
    1482,   11,   11,   11, 0x08,
    1522,   11,   11,   11, 0x08,
    1549,   11,   11,   11, 0x08,
    1590,   11,   11,   11, 0x08,
    1625, 1618,   11,   11, 0x08,
    1665,   11,   11,   11, 0x28,
    1700,   11,   11,   11, 0x08,
    1716,   11,   11,   11, 0x08,
    1778, 1762, 1749,   11, 0x08,
    1817, 1805,   11,   11, 0x08,
    1907, 1875,   11,   11, 0x08,
    1974,   11,   11,   11, 0x08,
    1999, 1995,   11,   11, 0x08,
    2048,   11,   11,   11, 0x08,
    2091, 2075,   11,   11, 0x08,
    2141, 2132,   11,   11, 0x28,
    2174,   11,   11,   11, 0x28,
    2224, 2202,   11,   11, 0x08,
    2272,   11,   11,   11, 0x08,
    2297,   11,   11,   11, 0x08,
    2350,   11,   11,   11, 0x08,
    2374,   11,   11,   11, 0x08,
    2393,   11,   11,   11, 0x08,
    2410,   11,   11,   11, 0x08,
    2426,   11,   11,   11, 0x08,
    2439,   11,   11,   11, 0x08,
    2458,   11,   11,   11, 0x08,
    2470,   11,   11,   11, 0x08,
    2498,   11,   11,   11, 0x08,
    2542, 2533,   11,   11, 0x08,
    2571,   11,   11,   11, 0x28,
    2596,   11,   11,   11, 0x08,
    2624,   11,   11,   11, 0x08,
    2646,   11,   11,   11, 0x08,
    2679,   11,   11,   11, 0x08,
    2704,   11,   11,   11, 0x08,
    2732,   11,   11,   11, 0x08,
    2753,   11,   11,   11, 0x08,
    2791,   11,   11,   11, 0x08,
    2818,   11,   11,   11, 0x08,
    2845,   11,   11,   11, 0x08,
    2876,   11,   11,   11, 0x08,
    2905,   11,   11,   11, 0x08,
    2934,  985,   11,   11, 0x08,
    2965,   11,   11,   11, 0x08,
    2994, 2981,   11,   11, 0x08,
    3023,   11,   11,   11, 0x08,
    3048, 3043,   11,   11, 0x08,
    3074, 3043,   11,   11, 0x08,
    3105, 3043,   11,   11, 0x08,
    3134,   11,   11,   11, 0x08,
    3165,   11,   11,   11, 0x08,
    3188,   11,   11,   11, 0x08,
    3211,   11,   11,   11, 0x08,
    3250, 3230,   11,   11, 0x08,
    3301,   11,   11,   11, 0x08,
    3328,   11,   11,   11, 0x08,
    3356,   11,   11,   11, 0x08,
    3369,   11,   11,   11, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_MainWindow[] = {
    "MainWindow\0\0expand\0setExpandOptionalParts(bool)\0"
    "id\0clickOnDictPane(QString)\0"
    "messageFromAnotherInstanceReceived(QString)\0"
    ",,\0showStatusBarMessage(QString,int,QPixmap)\0"
    "wordReceived(QString)\0,\0"
    "headwordReceived(QString,QString)\0"
    "setExpandMode(bool)\0hotKeyActivated(int)\0"
    "prepareNewReleaseChecks()\0"
    "checkForNewRelease()\0latestReleaseReplyReady()\0"
    "item\0foundDictsPaneClicked(QListWidgetItem*)\0"
    "pos\0foundDictsContextMenuRequested(QPoint)\0"
    "showDictionaryInfo(QString)\0"
    "showDictionaryHeadwords(QString)\0"
    "openDictionaryFolder(QString)\0dict\0"
    "editDictionary(Dictionary::Class*)\0"
    "name\0showFTSIndexingName(QString)\0"
    "addNewTab()\0tabCloseRequested(int)\0"
    "closeCurrentTab()\0closeAllTabs()\0"
    "closeRestTabs()\0switchToNextTab()\0"
    "switchToPrevTab()\0ctrlReleased()\0"
    "switchExpandOptionalPartsMode()\0"
    "createTabList()\0fillWindowsMenu()\0act\0"
    "switchToWindow(QAction*)\0backClicked()\0"
    "forwardClicked()\0titleChanged(ArticleView*,QString)\0"
    "iconChanged(ArticleView*,QIcon)\0"
    "pageLoaded(ArticleView*)\0tabSwitched(int)\0"
    "tabMenuRequested(QPoint)\0checked\0"
    "dictionaryBarToggled(bool)\0view\0"
    "pronounce(ArticleView*)\0pronounce()\0"
    "zoomin()\0zoomout()\0unzoom()\0doWordsZoomIn()\0"
    "doWordsZoomOut()\0doWordsZoomBase()\0"
    "applyWordsZoomLevel()\0editDictionaryGroup\0"
    "editDictionaries(uint)\0editDictionaries()\0"
    "editCurrentGroup()\0editPreferences()\0"
    "currentGroupChanged(QString)\0"
    "translateInputChanged(QString)\0"
    "checkModifiers,dictID\0"
    "translateInputFinished(bool,QString)\0"
    "checkModifiers\0translateInputFinished(bool)\0"
    "translateInputFinished()\0handleEsc()\0"
    "focusTranslateLine()\0"
    "wordListItemActivated(QListWidgetItem*)\0"
    "wordListSelectionChanged()\0"
    "dictsListItemActivated(QListWidgetItem*)\0"
    "dictsListSelectionChanged()\0,force\0"
    "jumpToDictionary(QListWidgetItem*,bool)\0"
    "jumpToDictionary(QListWidgetItem*)\0"
    "showDictsPane()\0dictsPaneVisibilityChanged(bool)\0"
    "ArticleView*\0switchToIt,name\0"
    "createNewTab(bool,QString)\0,,,contexts\0"
    "openLinkInNewTab(QUrl,QUrl,QString,ArticleView::Contexts)\0"
    "word,group,fromArticle,contexts\0"
    "showDefinitionInNewTab(QString,uint,QString,ArticleView::Contexts)\0"
    "typingEvent(QString)\0,id\0"
    "activeArticleChanged(const ArticleView*,QString)\0"
    "mutedDictionariesChanged()\0,inGroup,dictID\0"
    "showTranslationFor(QString,uint,QString)\0"
    ",inGroup\0showTranslationFor(QString,uint)\0"
    "showTranslationFor(QString)\0"
    ",dictIDs,searchRegExp\0"
    "showTranslationFor(QString,QStringList,QRegExp)\0"
    "showHistoryItem(QString)\0"
    "trayIconActivated(QSystemTrayIcon::ActivationReason)\0"
    "scanEnableToggled(bool)\0setAutostart(bool)\0"
    "showMainWindow()\0visitHomepage()\0"
    "visitForum()\0openConfigFolder()\0"
    "showAbout()\0showDictBarNamesTriggered()\0"
    "useSmallIconsInToolbarsTriggered()\0"
    "announce\0toggleMenuBarTriggered(bool)\0"
    "toggleMenuBarTriggered()\0"
    "on_clearHistory_triggered()\0"
    "on_newTab_triggered()\0"
    "on_actionCloseToTray_triggered()\0"
    "on_pageSetup_triggered()\0"
    "on_printPreview_triggered()\0"
    "on_print_triggered()\0"
    "printPreviewPaintRequested(QPrinter*)\0"
    "on_saveArticle_triggered()\0"
    "on_rescanFiles_triggered()\0"
    "on_showHideHistory_triggered()\0"
    "on_exportHistory_triggered()\0"
    "on_importHistory_triggered()\0"
    "on_alwaysOnTop_triggered(bool)\0"
    "focusWordList()\0searchInDock\0"
    "updateSearchPaneAndBar(bool)\0"
    "updateHistoryMenu()\0word\0"
    "addWordToHistory(QString)\0"
    "forceAddWordToHistory(QString)\0"
    "sendWordToInputLine(QString)\0"
    "storeResourceSavePath(QString)\0"
    "closeHeadwordsDialog()\0focusHeadwordsDialog()\0"
    "focusArticleView()\0proxy,authenticator\0"
    "proxyAuthentication(QNetworkProxy,QAuthenticator*)\0"
    "showFullTextSearchDialog()\0"
    "closeFullTextSearchDialog()\0showGDHelp()\0"
    "hideGDHelp()\0"
};

void MainWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        MainWindow *_t = static_cast<MainWindow *>(_o);
        switch (_id) {
        case 0: _t->setExpandOptionalParts((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 1: _t->clickOnDictPane((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->messageFromAnotherInstanceReceived((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 3: _t->showStatusBarMessage((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< const QPixmap(*)>(_a[3]))); break;
        case 4: _t->wordReceived((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->headwordReceived((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 6: _t->setExpandMode((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 7: _t->hotKeyActivated((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 8: _t->prepareNewReleaseChecks(); break;
        case 9: _t->checkForNewRelease(); break;
        case 10: _t->latestReleaseReplyReady(); break;
        case 11: _t->foundDictsPaneClicked((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        case 12: _t->foundDictsContextMenuRequested((*reinterpret_cast< const QPoint(*)>(_a[1]))); break;
        case 13: _t->showDictionaryInfo((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 14: _t->showDictionaryHeadwords((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 15: _t->openDictionaryFolder((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 16: _t->editDictionary((*reinterpret_cast< Dictionary::Class*(*)>(_a[1]))); break;
        case 17: _t->showFTSIndexingName((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 18: _t->addNewTab(); break;
        case 19: _t->tabCloseRequested((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 20: _t->closeCurrentTab(); break;
        case 21: _t->closeAllTabs(); break;
        case 22: _t->closeRestTabs(); break;
        case 23: _t->switchToNextTab(); break;
        case 24: _t->switchToPrevTab(); break;
        case 25: _t->ctrlReleased(); break;
        case 26: _t->switchExpandOptionalPartsMode(); break;
        case 27: _t->createTabList(); break;
        case 28: _t->fillWindowsMenu(); break;
        case 29: _t->switchToWindow((*reinterpret_cast< QAction*(*)>(_a[1]))); break;
        case 30: _t->backClicked(); break;
        case 31: _t->forwardClicked(); break;
        case 32: _t->titleChanged((*reinterpret_cast< ArticleView*(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 33: _t->iconChanged((*reinterpret_cast< ArticleView*(*)>(_a[1])),(*reinterpret_cast< const QIcon(*)>(_a[2]))); break;
        case 34: _t->pageLoaded((*reinterpret_cast< ArticleView*(*)>(_a[1]))); break;
        case 35: _t->tabSwitched((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 36: _t->tabMenuRequested((*reinterpret_cast< QPoint(*)>(_a[1]))); break;
        case 37: _t->dictionaryBarToggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 38: _t->pronounce((*reinterpret_cast< ArticleView*(*)>(_a[1]))); break;
        case 39: _t->pronounce(); break;
        case 40: _t->zoomin(); break;
        case 41: _t->zoomout(); break;
        case 42: _t->unzoom(); break;
        case 43: _t->doWordsZoomIn(); break;
        case 44: _t->doWordsZoomOut(); break;
        case 45: _t->doWordsZoomBase(); break;
        case 46: _t->applyWordsZoomLevel(); break;
        case 47: _t->editDictionaries((*reinterpret_cast< uint(*)>(_a[1]))); break;
        case 48: _t->editDictionaries(); break;
        case 49: _t->editCurrentGroup(); break;
        case 50: _t->editPreferences(); break;
        case 51: _t->currentGroupChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 52: _t->translateInputChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 53: _t->translateInputFinished((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 54: _t->translateInputFinished((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 55: _t->translateInputFinished(); break;
        case 56: _t->handleEsc(); break;
        case 57: _t->focusTranslateLine(); break;
        case 58: _t->wordListItemActivated((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        case 59: _t->wordListSelectionChanged(); break;
        case 60: _t->dictsListItemActivated((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        case 61: _t->dictsListSelectionChanged(); break;
        case 62: _t->jumpToDictionary((*reinterpret_cast< QListWidgetItem*(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 63: _t->jumpToDictionary((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        case 64: _t->showDictsPane(); break;
        case 65: _t->dictsPaneVisibilityChanged((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 66: { ArticleView* _r = _t->createNewTab((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< ArticleView**>(_a[0]) = _r; }  break;
        case 67: _t->openLinkInNewTab((*reinterpret_cast< const QUrl(*)>(_a[1])),(*reinterpret_cast< const QUrl(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const ArticleView::Contexts(*)>(_a[4]))); break;
        case 68: _t->showDefinitionInNewTab((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< uint(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const ArticleView::Contexts(*)>(_a[4]))); break;
        case 69: _t->typingEvent((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 70: _t->activeArticleChanged((*reinterpret_cast< const ArticleView*(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 71: _t->mutedDictionariesChanged(); break;
        case 72: _t->showTranslationFor((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< uint(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3]))); break;
        case 73: _t->showTranslationFor((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< uint(*)>(_a[2]))); break;
        case 74: _t->showTranslationFor((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 75: _t->showTranslationFor((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QStringList(*)>(_a[2])),(*reinterpret_cast< const QRegExp(*)>(_a[3]))); break;
        case 76: _t->showHistoryItem((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 77: _t->trayIconActivated((*reinterpret_cast< QSystemTrayIcon::ActivationReason(*)>(_a[1]))); break;
        case 78: _t->scanEnableToggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 79: _t->setAutostart((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 80: _t->showMainWindow(); break;
        case 81: _t->visitHomepage(); break;
        case 82: _t->visitForum(); break;
        case 83: _t->openConfigFolder(); break;
        case 84: _t->showAbout(); break;
        case 85: _t->showDictBarNamesTriggered(); break;
        case 86: _t->useSmallIconsInToolbarsTriggered(); break;
        case 87: _t->toggleMenuBarTriggered((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 88: _t->toggleMenuBarTriggered(); break;
        case 89: _t->on_clearHistory_triggered(); break;
        case 90: _t->on_newTab_triggered(); break;
        case 91: _t->on_actionCloseToTray_triggered(); break;
        case 92: _t->on_pageSetup_triggered(); break;
        case 93: _t->on_printPreview_triggered(); break;
        case 94: _t->on_print_triggered(); break;
        case 95: _t->printPreviewPaintRequested((*reinterpret_cast< QPrinter*(*)>(_a[1]))); break;
        case 96: _t->on_saveArticle_triggered(); break;
        case 97: _t->on_rescanFiles_triggered(); break;
        case 98: _t->on_showHideHistory_triggered(); break;
        case 99: _t->on_exportHistory_triggered(); break;
        case 100: _t->on_importHistory_triggered(); break;
        case 101: _t->on_alwaysOnTop_triggered((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 102: _t->focusWordList(); break;
        case 103: _t->updateSearchPaneAndBar((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 104: _t->updateHistoryMenu(); break;
        case 105: _t->addWordToHistory((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 106: _t->forceAddWordToHistory((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 107: _t->sendWordToInputLine((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 108: _t->storeResourceSavePath((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 109: _t->closeHeadwordsDialog(); break;
        case 110: _t->focusHeadwordsDialog(); break;
        case 111: _t->focusArticleView(); break;
        case 112: _t->proxyAuthentication((*reinterpret_cast< const QNetworkProxy(*)>(_a[1])),(*reinterpret_cast< QAuthenticator*(*)>(_a[2]))); break;
        case 113: _t->showFullTextSearchDialog(); break;
        case 114: _t->closeFullTextSearchDialog(); break;
        case 115: _t->showGDHelp(); break;
        case 116: _t->hideGDHelp(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData MainWindow::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MainWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_MainWindow,
      qt_meta_data_MainWindow, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MainWindow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MainWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MainWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MainWindow))
        return static_cast<void*>(const_cast< MainWindow*>(this));
    if (!strcmp(_clname, "DataCommitter"))
        return static_cast< DataCommitter*>(const_cast< MainWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int MainWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 117)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 117;
    }
    return _id;
}

// SIGNAL 0
void MainWindow::setExpandOptionalParts(bool _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void MainWindow::clickOnDictPane(QString const & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
static const uint qt_meta_data_ArticleSaveProgressDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      27,   26,   26,   26, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_ArticleSaveProgressDialog[] = {
    "ArticleSaveProgressDialog\0\0perform()\0"
};

void ArticleSaveProgressDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ArticleSaveProgressDialog *_t = static_cast<ArticleSaveProgressDialog *>(_o);
        switch (_id) {
        case 0: _t->perform(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ArticleSaveProgressDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ArticleSaveProgressDialog::staticMetaObject = {
    { &QProgressDialog::staticMetaObject, qt_meta_stringdata_ArticleSaveProgressDialog,
      qt_meta_data_ArticleSaveProgressDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ArticleSaveProgressDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ArticleSaveProgressDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ArticleSaveProgressDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ArticleSaveProgressDialog))
        return static_cast<void*>(const_cast< ArticleSaveProgressDialog*>(this));
    return QProgressDialog::qt_metacast(_clname);
}

int ArticleSaveProgressDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QProgressDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
