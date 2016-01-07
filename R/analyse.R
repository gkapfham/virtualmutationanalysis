#' FUNCTION: analyse_wilcox_rank_sum_test
#'

#' Perform a statistical analysis of the timings for the standard and virtual mutation analysis techniques.
#' @importFrom magrittr %>%
#' @export

analyse_wilcox_rank_sum_test <- function(d) {
  # extract the relevant data values for the standard method
  standard_time = d %>% filter(technique %in% c("Standard"))
  # extract the relevant data values for the virtual method
  virtual_time = d %>% filter(technique %in% c("Virtual"))
  # perform the statistical analysis and return a "tidy" version of the model
  model <- wilcox.test(virtual_time$mutationanalysistime, standard_time$mutationanalysistime)
  tidy_model <- model %>% tidy()
  return(tidy_model)
}


