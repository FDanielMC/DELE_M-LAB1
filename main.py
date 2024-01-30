import random

class Person:

    names = ["Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Henry", "Ivy", "Jack"]

    def __init__(self):
        self.name = random.choice(self.names)
        self.age = random.randint(18,100)
        self.skill_level = random.randint(1,10)
        self.winning_count = random.randint(0,20)

    def get_name(self):
        return self.name

    def set_name(self, name):
        self.name = name

    def get_age(self):
        return self.age

    def set_age(self, age):
        self.age = age

    def get_skill_level(self):
        return self.skill_level

    def set_skill_level(self, skill_level):
        self.skill_level = skill_level

    def get_winning_count(self):
        return self.winning_count

    def set_winning_count(self, winning_count):
        self.winning_count = winning_count
