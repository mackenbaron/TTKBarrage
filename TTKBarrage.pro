# =================================================
# * This file is part of the TTK Barrage project
# * Copyright (c) 2015 - 2017 Greedysky Studio
# * All rights reserved!
# * Redistribution and use of the source code or any derivative
# * works are strictly forbiden.
# =================================================

QT       += core gui

equals(QT_MAJOR_VERSION, 4){
QT       += multimedia
}
equals(QT_MAJOR_VERSION, 5){
QT       += widgets multimediawidgets
}

TARGET = TTKBarrage
TEMPLATE = app

win32{
    equals(QT_MAJOR_VERSION, 5):{
        msvc{
            !contains(QMAKE_TARGET.arch, x86_64){
                 #support on windows XP
                 QMAKE_LFLAGS_WINDOWS = /SUBSYSTEM:WINDOWS,5.01
            }
        }

        gcc{
            QMAKE_CXXFLAGS += -std=c++11
            QMAKE_CXXFLAGS += -Wunused-function
            QMAKE_CXXFLAGS += -Wswitch
        }
    }
    equals(QT_MAJOR_VERSION, 4):{
            QMAKE_CXXFLAGS += -std=c++11
            QMAKE_CXXFLAGS += -Wunused-function
            QMAKE_CXXFLAGS += -Wswitch
    }
}

INCLUDEPATH += $$PWD/core \
               $$PWD/widget \
               $$PWD/

TRANSLATIONS += cn.ts

SOURCES += \
        main.cpp \
        widget/barragewidget.cpp \
        widget/videocontrol.cpp \
        widget/barrageedit.cpp \
        core/barrageanimation.cpp \
        videoview.cpp

HEADERS  += \
        widget/barragewidget.h \
        widget/videocontrol.h \
        widget/barrageedit.h \
        core/barrageanimation.h \
        core/barragecore.h \
        videoview.h

RESOURCES+= TTKBarrage.qrc
