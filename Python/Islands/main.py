import PyQt5.QtWidgets as qt_widgets

import core.gui.types.application as application
import core.utils.map.exchange    as map_exchange
import core.utils.map.measure     as map_measure
import sys


def distance(line):
    import math
    # Get each point coordinates
    a_x, a_y = line[0]  # Point a
    b_x, b_y = line[1]  # Point b
    # Calculate two points distance by Pythagorean's formula
    # Distance = sqrt(dX^2 + dY^2)
    return math.sqrt((b_x - a_x) ** 2 + (b_y - a_y) ** 2)


# Open map data file
data_file = open('islands_data_1.txt', 'r')

# Create gui application
app    = qt_widgets.QApplication(sys.argv)  # Main app(Default as Qt Application)
window = application.application_t()        # Main GUI widget

# Read map data
map_data   = map_exchange.read_map(data_file)
map_edges  = map_exchange.convert_map2edges(map_data)  # Convert map data to islands edges
map_result = map_measure.smallest_lines(map_edges)     # Get distance between each islands

# Add each island to graphical view
for i in range(map_edges.length):
    edges = map_edges.get_at(i)
    window.create_polygon(edges)

# Add each result(distance between islands) to graphical view
for i in range(map_result.length):
    line = map_result.get_at(i)
    window.create_line(line)
    # Print it
    print(f"Answer {i + 1}:", line)
    print(f" + Distance: {distance(line): .3f}")

window.show()
sys.exit(app.exec_())
