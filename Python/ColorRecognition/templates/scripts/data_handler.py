from PyQt5 import QtCore as _qt_core
from .forum_printer import car_form_printer
import json


class static:
    null_signal = _qt_core.pyqtSignal()


def config_value(*args, config_attr='config', config_file_attr='update_config'):
    def inner(function):
        def reader(self):
            return getattr(self, config_attr)[function(self)]

        def writer(self, value):
            getattr(self, config_attr)[function(self)] = value
            getattr(self, config_file_attr)()

        return _qt_core.pyqtProperty(*args, fget=reader, fset=writer)

    return inner


class data_handler(_qt_core.QObject):
    config_path = r"app_config.json"

    @classmethod
    def init(cls):
        cls.config_file = cls.open_config_read()
        cls.config = json.loads(cls.config_file.read())

    @classmethod
    def open_config(cls, mode):
        cls.config_file = open(cls.config_path, mode, encoding='utf-8')
        return cls.config_file

    @classmethod
    def open_config_read(cls):
        return cls.open_config('r')

    @classmethod
    def open_config_write(cls):
        return cls.open_config('w')

    @classmethod
    def update_config(cls):
        cls.open_config_write().write(json.dumps(cls.config, ensure_ascii=False, indent=4))
        cls.open_config_read()

    @config_value(str)
    def address(self):
        return 'address'

    @config_value(list)
    def notes(self):
        return 'notes'

    @config_value(str)
    def output_dir(self):
        return 'output_dir'

    @_qt_core.pyqtSlot(car_form_printer)
    def add_car_form(self, car_form):
        self.config['cars'].append(car_form.data)
        self.update_config()


data_handler.init()
