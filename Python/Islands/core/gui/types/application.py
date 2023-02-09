# ide:formatter.off
import PyQt5.QtWidgets as qt_widgets
import PyQt5.QtCore    as qt_core
import PyQt5.QtGui     as qt_gui


scale = 45


class layout_container_t(qt_widgets.QWidget):
    def __init__(self, parent, layout):
        super().__init__(parent)

        self.layout = layout
        self.layout.setParent(self)

class maps_view_t(qt_widgets.QWidget):
    def __init__(self, parent):
        super().__init__(parent)

        self.visible_maps = self.visible_borders = self.visible_result = False

        self.lines    = []
        self.polygons = []

    def paintEvent(self, event):
        # ide:formatter.off
        painter = qt_gui.QPainter(self)

        pen = qt_core.Qt.NoPen
        if self.visible_borders:
            pen = qt_gui.QPen(qt_gui.QColor(0, 0, 0))
            pen.setWidth(5)

        brush = qt_core.Qt.NoBrush
        if self.visible_maps:
            image = qt_gui.QImage('assets/images/map_skin.jpg')
            image = image.scaled(300, 300, qt_core.Qt.IgnoreAspectRatio)

            brush = qt_gui.QBrush(image)
            brush.setStyle(qt_core.Qt.TexturePattern)

        painter.setPen  (pen)
        painter.setBrush(brush)

        for polygon in self.polygons:
            painter.drawPolygon(polygon)

        #
        #

        pen = qt_core.Qt.NoPen
        if self.visible_result:
            pen = qt_gui.QPen(qt_gui.QColor(255, 0, 0))
            pen.setWidth(5)

        painter.setPen  (pen)
        painter.setBrush(qt_core.Qt.NoBrush)

        for line in self.lines:
            painter.drawLine(line)
        # ide:formatter.on

class maps_container(qt_widgets.QScrollArea):
    def __init__(self, parent):
        super().__init__(parent)
        self.setBackgroundRole(qt_gui.QPalette.NoRole)

        self.frame = maps_view_t(self)
        self.frame.setFixedSize(10000, 10000)

        self.setWidget(self.frame)


class application_t(qt_widgets.QWidget):
    def __init__(self):
        super().__init__()
        self.setMinimumSize(900, 900)

        # ide:formatter.off
        self.main_layout = qt_widgets.QVBoxLayout(self)

        self.scrl_maps_container = maps_container(None)
        self.view_frame = self.scrl_maps_container.frame

        self.btns_layout = qt_widgets.QHBoxLayout()
        self.btns_layout.setAlignment(qt_core.Qt.AlignLeft)

        self.btn_show_maps    = qt_widgets.QPushButton(text="Maps"   )
        self.btn_show_borders = qt_widgets.QPushButton(text="Borders")
        self.btn_show_result  = qt_widgets.QPushButton(text="Result" )
        # ide:formatter.on

        self.init_components()
    
    # ide:formatter.off
    def show_maps(self):
        self.view_frame.visible_maps    = not self.view_frame.visible_maps
        self._update_button(self.btn_show_maps   , self.view_frame.visible_maps   )

    def show_borders(self):
        self.view_frame.visible_borders = not self.view_frame.visible_borders
        self._update_button(self.btn_show_borders, self.view_frame.visible_borders)

    def show_result(self):
        self.view_frame.visible_result  = not self.view_frame.visible_result
        self._update_button(self.btn_show_result , self.view_frame.visible_result )
    # ide:formatter.on

    def _update_button(self, button, state):
        button.setStyleSheet("QPushButton {"
                             f"   background-color : {'green' if state else 'white'};"
                             f"   color       : {'white' if state else 'black'};"
                             "}")

        self.view_frame.repaint()

    def create_polygon(self, edges):
        polygon = qt_gui.QPolygonF()

        for i in range(edges.length):
            point = edges.get_at(i)

            x = point[0] * scale
            y = point[1] * scale

            polygon.append(qt_core.QPointF(x, y))

        self.view_frame.polygons.append(polygon)

    def create_line(self, line):
        a, b = line

        a_x, a_y = a
        b_x, b_y = b

        line = qt_core.QLineF(int(a_x * scale), int(a_y * scale),
                              int(b_x * scale), int(b_y * scale))

        self.view_frame.lines.append(line)

    def init_components(self):
        # ide:formatter.off
        self.btn_show_maps   .setMaximumWidth(200)
        self.btn_show_borders.setMaximumWidth(200)
        self.btn_show_result .setMaximumWidth(200)

        self.btn_show_maps   .clicked.connect(self.show_maps   )
        self.btn_show_borders.clicked.connect(self.show_borders)
        self.btn_show_result .clicked.connect(self.show_result )

        self.btns_layout.addWidget(self.btn_show_maps   )
        self.btns_layout.addWidget(self.btn_show_borders)
        self.btns_layout.addWidget(self.btn_show_result )

        self.main_layout.addLayout(self.btns_layout        )
        self.main_layout.addWidget(self.scrl_maps_container)
        # ide:formatter.on
