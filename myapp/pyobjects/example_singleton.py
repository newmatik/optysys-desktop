#!/usr/bin/env python
# -*- coding: utf-8 -*-

from PySide6.QtCore import QObject, Signal, Property
from PySide6.QtQml import QmlElement, QmlSingleton

QML_IMPORT_NAME = "pyobjects"
QML_IMPORT_MAJOR_VERSION = 1


@QmlElement
@QmlSingleton
class SingletonPyObject(QObject):

    def get_exposed_property(self) -> str:
        return 'py property'

    exposed_property_changed = Signal(str)
    exposed_property = Property(str, get_exposed_property, notify=exposed_property_changed)
