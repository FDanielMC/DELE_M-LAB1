import random


def random_numbers_sum(n) :
    while True :
        a = random.randint(1, n)
        b = random.randint(1, n)
        c = random.randint(1, n)
        if (a + b + c == n) and (a != b) and (b != c) and (c != a) :
            break
    return a, b, c

def main() :
    n = int(input("Ingrese el valor de n: "))
    numbers = random_numbers_sum(n)
    sum = numbers[0] + numbers[1] + numbers[2]
    print(f"a = {numbers[0]}, b = {numbers[1]}, c = {numbers[2]}, a + b + c = {sum}")


main()
