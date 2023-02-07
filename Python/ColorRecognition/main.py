import sys

from PyQt5.QtQml import QQmlApplicationEngine, qmlRegisterType
from PyQt5.QtWidgets import QApplication
from templates.scripts.forum_printer import car_form_printer
from templates.scripts import data_handler

app = QApplication(sys.argv)
qmlRegisterType(data_handler.data_handler, 'Core', 1, 0, 'DataHandler')
qmlRegisterType(car_form_printer, 'Printer', 1, 0, 'CarFormPrinter')
engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load('main.qml')

sys.exit(app.exec())
