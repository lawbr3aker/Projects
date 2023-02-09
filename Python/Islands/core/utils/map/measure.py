import math
import core.types.collections.linked_list as core_list


def distance(a, b):
    a_x, a_y = a
    b_x, b_y = b

    return math.sqrt((b_x - a_x) ** 2 + (b_y - a_y) ** 2)


def smallest_line(edges_a, edges_b):
    # ide:formatter.off
    min_distance = None
    min_points   = None
    # ide:formatter.on
    for edge_a_index in range(edges_a.length):
        a = edges_a.get_at(edge_a_index)
        for edge_b_index in range(edges_b.length):
            b = edges_b.get_at(edge_b_index)

            ab_distance = distance(a, b)
            if min_distance is None or ab_distance < min_distance:
                # ide:formatter.off
                min_distance = ab_distance
                min_points   = (a, b)
                # ide:formatter.on

    return min_points


def smallest_lines(map_edges):
    result = core_list.linked_list_t()
    for i in range(map_edges.length):
        for j in range(i + 1, map_edges.length):
            edges_a = map_edges.get_at(i)
            edges_b = map_edges.get_at(j)

            result.append(smallest_line(edges_a, edges_b))

    return result
