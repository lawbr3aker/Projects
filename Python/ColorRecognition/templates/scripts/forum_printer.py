from PyQt5 import QtCore as _qt_core
from PIL import (
    Image     as pil_image_t,
    ImageFont as pil_font_t,
    ImageDraw as pil_draw_t)
import time
from arabic_reshaper.arabic_reshaper import (
    reshape as arabic_reshape)
from bidi.algorithm import (
    get_display as arabic_get_display)
from core.scripts.printer.printer import printer_t


def form_field(args=(str,)):
    def field_by_function(function: callable):
        def field_setter(self, value):
            function(self)[function.__name__] = value

        def field_getter(self):
            return function(self)[function.__name__]

        return _qt_core.pyqtProperty(*args, fget=field_getter, fset=field_setter)

    return field_by_function


class car_form_printer(_qt_core.QObject):
    base_form = 'assets/images/base_form.jpg'
    base_font = pil_font_t.truetype('arial', 25)

    report_forms = [
            'assets/images/report_forms/car_report_1.jpg'
    ]
    fields = {
            'date'          : {'coord': [218, 130], 'color': 'blue'},
            #
            'car_name'      : {'coord': [1090, 202], 'color': 'blue'},
            'model'         : {'coord': [751, 202], 'color': 'blue'},
            'color'         : {'coord': [512, 202], 'color': 'blue'},
            'car_number'    : {'coord': [208, 202], 'color': 'blue'},
            'chassis_number': {'coord': [208, 240], 'color': 'blue'},
            'motor_number'  : {'coord': [208, 275], 'color': 'blue'},
            #
            'by_who'        : {'coord': [1008, 303], 'color': 'blue'},
            'cellphone'     : {'coord': [675, 303], 'color': 'blue'},
            'time'          : {'coord': [364, 303], 'color': 'blue'},
            #
            'description'   : {'coord': [1180, 370], 'color': 'blue'},
            #
            'notes'         : {'coord': [1140, 595], 'color': 'black',
                               'font' : pil_font_t.truetype(r'assets\fonts\A.Rezvan.ttf', 27)},
            'address'       : {'coord': [1140, 790], 'color': 'black',
                               'font' : pil_font_t.truetype(r'assets\fonts\A.Rezvan.ttf', 27)}
    }
    color_report_padding = 130

    def __init__(self, parent):
        super(car_form_printer, self).__init__(parent)

        self.printer = printer_t()
        self.data = {field_name: ''
                     for field_name in car_form_printer.fields}

        self.__to_print = ''

    # @formatter:off
    @form_field()
    def car_name       (self): return self.data
    @form_field()
    def model          (self): return self.data
    @form_field()
    def color          (self): return self.data
    @form_field()
    def car_number     (self): return self.data
    @form_field()
    def chassis_number (self): return self.data
    @form_field()
    def motor_number   (self): return self.data
    @form_field()
    def by_who         (self): return self.data
    @form_field()
    def cellphone      (self): return self.data
    @form_field()
    def time           (self): return self.data
    @form_field()
    def description    (self): return self.data
    @form_field()
    def address        (self): return self.data
    @form_field((list, ))
    def notes          (self): return self.data
    # @formatter:on

    @_qt_core.pyqtSlot(int, str)
    def save(self, what, output):
        self.data['date'] = time.strftime("%Y/%m/%d\n%H:%M")
        with pil_image_t.open(self.base_form) as form:
            form_drawer = pil_draw_t.Draw(form)
            # get form size
            form_width, form_height = form.size

            # draw fields value
            for field, attributes in self.fields.items():
                # field position on form
                field_x, field_y = attributes['coord']
                # field value
                filed_value = self.data[field]
                if type(filed_value) is not list:  # field value must be list
                    filed_value = [filed_value]

                font = self.base_font
                if 'font' in attributes:
                    font = attributes['font']
                line_height = font.size * 1.2
                for i, line in enumerate(filed_value):
                    reshaped = arabic_get_display(arabic_reshape(line))
                    text_width = form_drawer.textsize(reshaped, font=font)[0]
                    form_drawer.text((field_x - text_width, field_y + i * line_height), reshaped,
                                     attributes['color'],
                                     font=font)
            # add color report image
            color_report = pil_image_t.open(self.report_forms[what])
            color_report_width, color_report_height = color_report.size
            report_image_width_scaled = form_width - self.color_report_padding * 2
            report_image_height_scaled = report_image_width_scaled / color_report_width * color_report_height
            # resize
            color_report = color_report.resize((int(report_image_width_scaled), int(report_image_height_scaled)),
                                               pil_image_t.ANTIALIAS)
            form.paste(color_report,
                       (self.color_report_padding, int(form_height -
                                                       report_image_height_scaled - self.color_report_padding / 2)))
            # add to print queue
            self.__to_print = rf'{output}\{time.strftime("%Y%m%d-%H%M%S")}.jpg'
            form.save(self.__to_print)

    @_qt_core.pyqtSlot(int, str)
    def print(self, what, output):
        self.save(what, output)
        self.printer.print(self.__to_print)
        self.__to_print = ''
