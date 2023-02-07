from PyQt5 import QtCore as _qt_core
from PyQt5 import QtGui as _qt_gui
from PyQt5 import QtPrintSupport as _qt_printer
from PyQt5 import QtWidgets as _qt_widgets
from PyQt5.QtCore import Qt as _qt
from PIL import ImageQt as _qt_image


class printer_t(_qt_printer.QPrinter):
    printer_modes = _qt_printer.QPrinter.PrinterMode
    dialog_codes = _qt_printer.QPrintDialog.DialogCode

    def __init__(self):
        super(printer_t, self).__init__(printer_t.printer_modes.HighResolution)

        self._widget = _qt_widgets.QWidget()
        self._dialog = _qt_printer.QPrintDialog(self)

    def print(self, path: str):
        file_info = _qt_core.QFileInfo(path)
        if not file_info.exists():
            print(FileNotFoundError(f"Path '{path}' doesn't exist to print!"))
        else:
            if self._dialog.exec_() == printer_t.dialog_codes.Accepted:
                file_suffix = file_info.completeSuffix()

                painter = _qt_gui.QPainter()
                painter.begin(self)

                painter_rect = painter.viewport()

                if file_suffix == "jpg":
                    image = _qt_image.ImageQt(path)

                    image_scaled = image.scaled(painter_rect.size(), _qt.KeepAspectRatio, _qt.SmoothTransformation)

                    painter.drawImage(painter_rect, image_scaled)

                painter.end()

