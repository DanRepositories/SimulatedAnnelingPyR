source("SimulatedAnneling.r")

# Distance matrix for example instance
distance_array = c(0, 8, 4, 9, 9);
distance_array = c(distance_array, 8, 0, 6, 7, 10);
distance_array = c(distance_array, 4, 6, 0, 5, 6);
distance_array = c(distance_array, 9, 7, 5, 0, 4);
distance_array = c(distance_array, 9, 10, 6, 4, 0);
distance_matrix = matrix(distance_array, nrow=5);

example_function <- function(x)
{
  sum_distances = 0;
  length_sol = length(x);
  for (i in 2:length_sol) {
    current_distance = distance_matrix[x[i - 1], x[i]];
    sum_distances = sum_distances + current_distance;
  }

  sum_distances = sum_distances + distance_matrix[x[length_sol], x[1]];
  return(sum_distances);
}

objective_function = example_function;
t0 = 100;
tmin = 10;
alpha = 0.4;
D = 5

x = execute(objective_function, t0, tmin, alpha, D)
print(x)
print(example_function(x))

