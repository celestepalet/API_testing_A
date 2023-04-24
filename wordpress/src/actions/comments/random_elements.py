import random


class RandomComments:
    """Returns a random element"""

    def random_animals_comments_list(self):
        """Returns a random animals list"""
        comment_list = []
        animal_list = ['alligator', 'bee', 'cat', 'dinosaur', 'elephant', 'fox', 'giraffe', 
                       'horse', 'iguana', 'jaguar', 'kangaroo', 'lion', 'monkey', 'nutria',
                       'octopus', 'panda', 'rat', 'snake', 'tiger', 'worm', 'zebra']
        for x in range (30):
            string = str(x) + ": " +  random.choice(animal_list)
            comment_list.append(string)
        return comment_list
