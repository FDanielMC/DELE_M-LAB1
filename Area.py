def calculate_area(num_subintervals) :
    width_rectangle = 1 / num_subintervals
    area = 0.0
    for subinterval in range(num_subintervals) :
        midpoint = 1 + subinterval * width_rectangle
        height_rectangle = (midpoint ** 2) + 2
        area += height_rectangle * width_rectangle
    return area


def main() :
    num_subintervals = int(input("Ingrese el valor de n-subintervalos: "))
    area_first_function = calculate_area(num_subintervals)
    area_second_function = 1.5
    area_between_functions = area_first_function - area_second_function
    print(f"Aproximación de la integral de la primer función: {area_first_function}")
    print(f"Integral de la segunda función: {area_second_function}")
    print(f"El área entre las dos funciones es: {area_between_functions}")


main()
