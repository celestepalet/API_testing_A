import random


class GenerateNames:
    def generate_random_name(self):
        """Generate a random first name"""
        first_names = ["Adams", "Brown", "Clark", "Davis", "Edwards", "Ford", "Garcia", "Harris", "Jackson", "Kim",
                       "Lee", "Martin", "Nguyen", "O'Brien", "Perez", "Quinn", "Rodriguez", "Smith", "Taylor", "Upton",
                       "Vargas", "Williams", "Xu", "Young", "Zhang"]
        name = random.choice(first_names)
        return name

    def generate_random_last_name(self):
        """Generate a random first name"""
        last_names = ["Alice", "Bob", "Charlie", "David", "Emily", "Frank", "Grace", "Henry", "Isabella", "James",
                       "Kate", "Liam", "Mia", "Nathan", "Olivia", "Peter", "Quinn", "Ryan", "Sophia", "Thomas",
                       "Ursula", "Victoria", "William", "Xavier", "Yvonne", "Zoe"]
        last_name = random.choice(last_names)
        return last_name



