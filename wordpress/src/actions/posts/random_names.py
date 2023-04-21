import random
import string

class RandomValues:
    def generate_random_chars(self):
        letters_digits_and_symbols = string.ascii_letters + string.digits + string.punctuation
        chars = ''.join(random.choice(letters_digits_and_symbols) for i in range(5001))
        return chars
    
    def generate_random_slug(self):
        letters_digits_and_symbols = string.ascii_letters + string.digits + string.punctuation
        slug = ''.join(random.choice(letters_digits_and_symbols) for i in range(10))
        return slug
    
    def generate_random_title(self):
        title = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        return title
    
    def generate_random_content(self):
        content = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        return content

    def generate_ignore(self):
        ignore = ["password", "guid", ("title", "raw"), ("content", "block_version"), ("content", "raw"), ("excerpt", "raw"), "permalink_template", "generated_slug", "_links"]
        return ignore





