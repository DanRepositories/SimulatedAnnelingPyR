from SimulatedAnneling import SimulatedAnneling

distance_matrix = [
    [0, 8, 4, 9, 9],
    [8, 0, 6, 7, 10],
    [4, 6, 0, 5, 6],
    [9, 7, 5, 0, 4],
    [9, 10, 6, 4, 0]]

def example_function(x):
    sum_distances = 0
    for i in range(1, len(x)):
        sum_distances += distance_matrix[x[i - 1]][x[i]]

    sum_distances += distance_matrix[x[-1]][x[0]]
    return sum_distances

objective_function = example_function
t0 = 100
tmin = 10
alpha = 0.4

sa = SimulatedAnneling(objective_function, t0, tmin, alpha)
print(sa.execute())

