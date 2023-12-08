#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys


class PreStartUp:
    """Necessary steps for environment, Python and Qt"""

    @staticmethod
    def set_qt_application_name():
        from PySide6.QtCore import QCoreApplication
        QCoreApplication.setApplicationName('my app name')
        QCoreApplication.setOrganizationName('my org name')

    @staticmethod
    def set_qt_application_version():
        from PySide6.QtCore import QCoreApplication
        QCoreApplication.setApplicationVersion('my app version')

    @staticmethod
    def inject_environment_variables():
        # Qt expects 'qtquickcontrols2.conf' at root level, but the way we handle resources does not allow that.
        # So we need to override the path here
        os.environ['QT_QUICK_CONTROLS_CONF'] = ':/data/qtquickcontrols2.conf'


class StartUp:
    """Necessary steps for myapp"""

    @staticmethod
    def import_resources():
        try:
            import myapp.generated_resources
        except ImportError as e:
            print(e, file=sys.stderr)
            sys.exit(1)

    @staticmethod
    def import_bindings():
        try:
            import myapp.pyobjects
        except ImportError as e:
            print(e, file=sys.stderr)
            sys.exit(1)

    @staticmethod
    def start_application():
        from myapp.application import MyApplication
        app = MyApplication(sys.argv)

        app.set_window_icon()
        app.set_up_signals()
        app.set_up_imports()
        app.start_engine()
        app.verify()

        sys.exit(app.exec())


def perform_startup():
    we = PreStartUp()
    we.set_qt_application_name()
    we.set_qt_application_version()
    we.inject_environment_variables()

    we = StartUp()
    we.import_resources()
    we.import_bindings()
    we.start_application()
