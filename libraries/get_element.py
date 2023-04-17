class GetElement:
    """Gets an element from an iterable variable"""
    def get_dictionary_value(self, key, dictionary):
        """Gets a value from a dictionary """
        element = dictionary[key]
        return element

    def get_list_element(self, index, list):
        """Gets an element from a list"""
        element = list[int(index)]
        return element
