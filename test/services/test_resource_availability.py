#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pytest
from PySide6.QtCore import QFile  # pylint: disable=no-name-in-module


@pytest.mark.parametrize('file_path', [
    ':/data/app-icon.svg',
    ':/i18n/de_DE.qm'
])
def test_resource_exist(file_path):
    file = QFile(file_path)
    assert file.exists()


def test_resource_does_not_exist():
    file = QFile(':/random/file/which/not.exists')
    assert not file.exists()
