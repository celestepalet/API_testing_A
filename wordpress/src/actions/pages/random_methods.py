import random
import string


class RandomMethods:
    """Returns a random things"""
    def random_password(self):
        """Returns a random password"""
        characters = string.ascii_letters + string.digits
        length = random.randint(10, 15)
        password = ''.join(random.choice(characters) for i in range(length))
        return password
