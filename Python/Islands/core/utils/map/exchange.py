# ide:formatter.off
import core.utils.map.base                as core_map
import core.types.collections.linked_list as core_list
# ide:formatter.on

# Read map data from file
def read_map(file_object):
    width, height = convert_strings2integers(file_object.readline().split())

    plane = core_list.linked_list_t()
    for row_index in range(height):
        row = core_list.linked_list_t()
        for column in convert_strings2integers(file_object.readline().split()):
            row.append(column)

        plane.append(row)

    return core_map.map_t(plane, width, height)


# Convert collection of strings to collection of integers
def convert_strings2integers(strings_collection):
    return map(int, strings_collection)


# Find edges of islands
def find_edges(map_object, shapes, x, y, result=None):
    if result is None:
        result = core_list.linked_list_t()

    # ide:formatter.off
    first_point = core_map.coord_t(x, y)
    last_state  = True
    for side in core_map.sides.all:
        last_point    = first_point.update(side)
        current_state = False
        # ide:formatter.on

        if map_object.get_at(last_point.x, last_point.y):
            current_state = True

            if not last_state:
                if not result.contains((last_point.x, last_point.y)):
                    result.append((last_point.x, last_point.y))

                    tx = last_point.x
                    while map_object.get_at(tx, last_point.y):
                        shapes.append((tx, last_point.y))
                        tx -= 1
                    tx = last_point.x + 1
                    while map_object.get_at(tx, last_point.y):
                        shapes.append((tx, last_point.y))
                        tx += 1

                    find_edges(map_object, shapes, last_point.x, last_point.y, result)

        last_state = current_state

    return result


def convert_map2edges(map_object):
    map_bound = map_object.bound()

    # ide:formatter.off
    edges  = core_list.linked_list_t()
    shapes = core_list.linked_list_t()
    # ide:formatter.on

    for y in range(map_bound.height):
        for x in range(map_bound.width):
            if map_object.get_at(x, y):
                if not shapes.contains((x, y)):
                    edge = find_edges(map_object, shapes, x, y)
                    edges.append(edge)

    return edges
