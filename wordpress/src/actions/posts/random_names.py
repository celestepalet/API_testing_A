import random
import string
from datetime import datetime 

class RandomValues:
    """Generate ramdom values for tests"""
    def generate_random_chars(self):
        """Generate ramdom characters for tests"""
        letters_digits_and_symbols = string.ascii_letters + string.digits + string.punctuation
        chars = ''.join(random.choice(letters_digits_and_symbols) for i in range(65536))
        return chars
    
    def generate_random_slug(self):
        """Generate ramdom slugs identifiers for tests"""
        letters_digits_and_symbols = string.ascii_letters + string.digits + string.punctuation
        slug = "12345tABCabc" + ''.join(random.choice(letters_digits_and_symbols) for i in range(4))
        return slug
    
    def generate_random_title(self):
        """Generate ramdom titles for tests"""
        title = "testing title" + ''.join(random.choices(string.ascii_letters + string.digits, k=4))
        return title
    
    def generate_random_content(self):
        """Generate ramdom contents for tests"""
        content = "testing content" + ''.join(random.choices(string.ascii_letters + string.digits, k=4))
        return content
    
    def generate_random_date(self):
        """Generate ramdom dates for tests"""
        start_date = datetime(1900, 1, 1)
        end_date = datetime(2023, 1, 1)
        random_date = start_date + (end_date - start_date) * random.random()
        date = random_date.strftime('%Y-%m-%d %H:%M:%S')
        return date

    def generate_ignore(self):
        """Create a list for tests"""
        ignore = ["password", "guid", ("title", "raw"), ("content", "block_version"), ("content", "raw"), ("excerpt", "raw"), "permalink_template", "generated_slug", "_links"]
        return ignore
