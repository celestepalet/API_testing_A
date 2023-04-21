import random
import string

class RandomNames:
    def generate_random_string(self):
        letters_digits_and_symbols = string.ascii_letters + string.digits + string.punctuation
        name = ''.join(random.choice(letters_digits_and_symbols) for i in range(1000))
        slug = ''.join(random.choice(letters_digits_and_symbols) for i in range(10))
        title = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        content = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        body_name = {"name": name}
        body_slug = {"slug": slug}
        body_title = {"title": title}
        body_content = {"name": content}
        return body_name, body_slug, body_title, body_content
