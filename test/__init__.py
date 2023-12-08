#!/usr/bin/env python
# -*- coding: utf-8 -*-

try:
    import test.generated_resources
except ImportError:
    import sys

    print('Can not find resource module \'test.generated_resources\'', file=sys.stderr)
    print('To execute individual tests, please run \'make test\' once before', file=sys.stderr)
    sys.exit(1)
