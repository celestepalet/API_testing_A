import random
import string

class RandomValues:
    """Generate ramdom values for tests"""
    def generate_random_chars(self):
        """Generate ramdom characters for tests"""
        letters_digits_and_symbols = string.ascii_letters + string.digits + string.punctuation
        chars = ''.join(random.choice(letters_digits_and_symbols) for i in range(5001))
        return chars
    
    def generate_random_slug(self):
        """Generate ramdom slugs identifiers for tests"""
        letters_digits_and_symbols = string.ascii_letters + string.digits + string.punctuation
        slug = ''.join(random.choice(letters_digits_and_symbols) for i in range(10))
        return slug
    
    def generate_random_title(self):
        """Generate ramdom titles for tests"""
        title = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        return title
    
    def generate_random_content(self):
        """Generate ramdom contents for tests"""
        content = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        return content

    def generate_ignore(self):
        """Create a list for tests"""
        ignore = ["password", "guid", ("title", "raw"), ("content", "block_version"), ("content", "raw"), ("excerpt", "raw"), "permalink_template", "generated_slug", "_links"]
        return ignore
