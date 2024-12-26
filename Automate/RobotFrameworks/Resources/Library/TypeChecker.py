# To make it a Robot Framework library
from robot.api.deco import keyword


class TypeChecker:
    @keyword
    def get_str(self, variable):
        return str(type(variable))

    @keyword
    def get_int(self, variable):
        return str(type(variable))