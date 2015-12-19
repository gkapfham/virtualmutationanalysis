#' FUNCTION: calculate_mutation_score_correlation
#'

#' Determine the correlation between the mutation scores produced by the virtual mutation and time-constrained original
#' methods. Calculates Kendall's Tau_b and, additionally, returns the p-value for the hypothesis test.
#' @importFrom magrittr %>%
#' @export

calculate_mutation_score_correlation <- function(data) {
  model <- cor.test(data$vm_score, data$selection_score, method="kendall", use="pairwise")
  tidy_model <- model %>% tidy()
  return(tidy_model)
}


