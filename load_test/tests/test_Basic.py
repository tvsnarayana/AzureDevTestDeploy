# -*- coding: iso-8859-15 -*-
"""Basic FunkLoad test

"""
import unittest
from random import random
from funkload.FunkLoadTestCase import FunkLoadTestCase

class Basic(FunkLoadTestCase):
    def setUp(self):
        self.server_url = self.conf_get('main', 'url')

    def test_basic(self):
        server_url = self.server_url
        nb_time = self.conf_getInt('test_basic', 'nb_time')
        for i in range(nb_time):
            self.get(server_url, description='Get URL')

if __name__ in ('main', '__main__'):
    unittest.main()

