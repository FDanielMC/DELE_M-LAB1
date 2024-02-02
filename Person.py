import random


class Person :
    names = ["Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Henry", "Ivy", "Jack"]

    def __init__(self) :
        self.name = random.choice(self.names)
        self.age = random.randint(18, 100)
        self.skill_level = random.randint(1, 10)
        self.winning_count = 0

    def get_name(self) :
        return self.name

    def set_name(self, name) :
        self.name = name

    def get_age(self) :
        return self.age

    def set_age(self, age) :
        self.age = age

    def get_skill_level(self) :
        return self.skill_level

    def set_skill_level(self, skill_level) :
        self.skill_level = skill_level

    def get_winning_count(self) :
        return self.winning_count

    def set_winning_count(self, winning_count) :
        self.winning_count = winning_count

    def add_winning(self) :
        self.winning_count += 1

    def play_against(self, person) :
        print(f"{self.name} (W:{self.winning_count}/SL:{self.skill_level}) vs {person.name} (W:{person.winning_count}" +
              f"/SL:{person.skill_level})")
        skill_level_difference = abs(self.skill_level - person.skill_level)
        probability = 100
        if skill_level_difference <= 2 :
            probability = 50
        elif skill_level_difference <= 4 :
            probability = 75
        higher_skill_level = person
        lower_skill_level = self
        if person.skill_level < self.skill_level :
            higher_skill_level = self
            lower_skill_level = person
        winner = higher_skill_level if random.randint(1, 100) < probability else lower_skill_level
        winner.add_winning()
        print(f"Winner: {winner.get_name()}")
        print(f"Result {self.get_name()} (W:{self.winning_count}) - {person.get_name()} (W:{person.winning_count})")

    def main() :
        people = [Person() for p in range(10)]
        for x in range(20) :
            print(f"Iteration: {x + 1}")
            for p in people :
                opponent = random.choice(people)
                p.play_against(opponent)

    main()
