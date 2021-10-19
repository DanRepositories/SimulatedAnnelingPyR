update_temp <- function(alpha, current_temp)
{
  new_temp = alpha * current_temp;
  return(new_temp);
}

generate_initial_solution <- function(D)
{
  return(sample(c(1:D)));
}

next_step <- function(solution)
{
  index_to_swap = sample(c(1:length(solution)), 2);
  idx1 = index_to_swap[1];
  idx2 = index_to_swap[2];

  aux = solution[idx1];
  solution[idx1] = solution[idx2];
  solution[idx2] = aux;

  return(solution);
}

get_probability <- function(delta_fitness, current_temp)
{
  probability = exp(-delta_fitness / current_temp);
  return(probability);
}

execute <- function(ObjFunc, t0, tmin, alpha, D)
{
  X = generate_initial_solution(D);
  Xfitness = ObjFunc(X);
  best <- X;
  F_min = Xfitness;

  t = t0;
  while (t > tmin)
  {
    # Generate a new solution from the current solution
    newX = next_step(X);
    newX_fitness = ObjFunc(newX);

    delta_fitness = newX_fitness - Xfitness;

    if (delta_fitness < 0) {
      X <- newX;
      Xfitness <- newX_fitness;
    } else {
      p = get_probability(delta_fitness, t);

      if (runif(1, 0, 1) < p) {
        X <- newX;
        Xfitness <- newX_fitness;
      }
    }

    if (Xfitness < F_min) {
      best <- X;
      F_min <- Xfitness;
    }
    
    t = update_temp(alpha, t);
  }

  return(best);
}
