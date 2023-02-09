"""
Base definition of program list
"""

class node_t:
    def __init__(self, value, left=None, right=None):
        # ide:formatter.off
        self.value = value

        self.left  = left
        self.right = right
        # ide:formatter.on

    def connect(self, node_object):
        # ide:formatter.off
        self.right = node_object
        if node_object:
            node_object.left = self
        # ide:formatter.on


class linked_list_t:
    def __init__(self):
        # ide:formatter.off
        self.head   = None
        self.length = 0
        # ide:formatter.on

    def is_empty(self):
        return self.length == 0

    def last(self):
        if not self.is_empty():
            last = self.head
            while True:
                if last.right is not None:
                    last = last.right
                else:
                    break

            return last

    def append(self, value):
        node = node_t(value)
        # connect new node to list
        if self.is_empty():
            self.head = node
        else:
            self.last().connect(node)
        # increase items count
        self.length += 1

    def apply(self, function_object):
        if not self.is_empty():
            last = self.head
            while True:
                function_object(last.value)

                if last.right is not None:
                    last = last.right
                else:
                    break

    def get_node_at(self, index):
        if index < self.length:
            node = self.head
            for i in range(index):
                node = node.right

            return node

    def get_at(self, index):
        if index < self.length:
            return self.get_node_at(index).value

    def remove_at(self, index):
        if index == 0:
            # ide:formatter.off
            self.head      = self.head.right
            self.head.left = None
            # ide:formatter.on
        else:
            to_remove = self.get_node_at(index)
            to_remove.left.connect(to_remove.right)

    def find(self, value):
        if not self.is_empty():
            index = 0
            last = self.head
            while True:
                if last.value == value:
                    return index
                if last.right is not None:
                    last = last.right
                    index += 1
                else:
                    break

    def contains(self, value):
        return self.find(value) is not None
