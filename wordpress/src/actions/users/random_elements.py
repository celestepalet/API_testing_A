import random
import names
from faker import Faker


class RandomElements:
    """Returns a random element"""

    def random_role(self):
        """Returns a random user role from the list"""
        roles_list = ['administrator', 'editor', 'contributor', 'author', 'subscriber']
        return random.choice(roles_list)

    def random_username(self):
        """Returns a random username"""
        username = names.get_full_name()
        return username

    def random_email(self):
        """Returns a random email"""
        fake = Faker()
        email = fake.email()
        return email