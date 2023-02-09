class sides:
    # ide:formatter.off
    up     = 1
    bottom = 2
    left   = 4
    right  = 8

    up_right     = up     | right
    bottom_right = bottom | right
    up_left      = up     | left
    bottom_left  = bottom | left

    all = (up, up_right, right, bottom_right, bottom, bottom_left, left, up_left, up)
    # ide:formatter.on


# Store size of object
# * Width and Height
class bound_t:
    def __init__(self, width, height):
        # ide:formatter.off
        self.width  = width
        self.height = height
        # ide:formatter.on


# Position of object in plane
# * X and Y
class coord_t:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    # Check current position is in square or not!
    def inbound(self, bound):
        return 0 <= self.x < bound.width and 0 <= self.y < bound.height

    # Move current position to given side
    def update(self, side):
        updated = coord_t(self.x, self.y)
        # ide:formatter.off
        if side & sides.up    :
            updated.y -= 1  # Move up
        if side & sides.bottom:
            updated.y += 1  # Move down
        if side & sides.left  :
            updated.x -= 1  # Move left
        if side & sides.right :
            updated.x += 1  # Move right
        # ide:formatter.on

        return updated


# Data of map
#  * Plane
#  * Bounds
class map_t:
    def __init__(self, plane, width, height):
        self._plane = plane
        self._bound = bound_t(width, height)

    def bound(self):
        return self._bound

    # Get object at position (x, y) on plane
    def get_at(self, x, y):
        as_coord = coord_t(x, y)
        if self.is_valid(as_coord):
            return self._plane.get_at(y).get_at(x)

        return None

    # Check given coordinate is in plane or not
    def is_valid(self, coord):
        return coord.inbound(self._bound)
