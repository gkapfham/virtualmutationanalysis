#' FUNCTION: analyse_wilcox_rank_sum_test
#'

#' Perform a statistical analysis of the timings for the standard and virtual mutation analysis techniques.
#' @importFrom magrittr %>%
#' @export

analyse_wilcox_rank_sum_test <- function(d) {
  # extract the relevant data values for the standard method
  standard_time <- d %>% dplyr::filter(technique %in% c("Standard"))
  # extract the relevant data values for the virtual method
  virtual_time <- d %>% dplyr::filter(technique %in% c("Virtual"))
  # --> extract the relevant data values for the HyperSQL database
  standard_time_hypersql = standard_time %>% dplyr::filter(dbms %in% c("HyperSQL"))
  virtual_time_hypersql = virtual_time %>% dplyr::filter(dbms %in% c("HyperSQL"))
  perform_wilcox_rank_sum_test(standard_time_hypersql, virtual_time_hypersql)
}

#' FUNCTION: perform_wilcox_rank_sum_test
#'

#' Perform a single Wilcoxon rank-sum test for two input data sets.
#' @importFrom magrittr %>%
#' @export

perform_wilcox_rank_sum_test <- function(v,s) {
  # perform the statistical analysis and return a "tidy" version of the model
  model <- wilcox.test(v$mutationanalysistime, s$mutationanalysistime)
  tidy_model <- model %>% broom::tidy()
  return(tidy_model)
}

#' FUNCTION: analyse_vargha_delaney_effect_size
#'

#' Perform an effect size analysis of the timings for the standard and virtual mutation analysis techniques.
#' @importFrom magrittr %>%
#' @export

analyse_vargha_delaney_effect_size_specify <- function(d, e) {
  # extract the relevant data values for the standard method
  standard_time <- d %>% dplyr::filter(technique %in% c("Standard"))
  # extract the relevant data values for the virtual method
  virtual_time <- d %>% dplyr::filter(technique %in% c("Virtual"))
  # perform the statistical analysis and return a "tidy" version of the model
  # it is important to note that the first parameter is the "treatment" and the second parameter is the "control"
  # passing the parameters in the opposite order will yield the opposite conclusion for the data sets
  model <- e(virtual_time$mutationanalysistime, standard_time$mutationanalysistime)
  return(model)
}

#' FUNCTION: analyse_vargha_delaney_effect_size
#'

#' Perform an effect size analysis of the timings for the standard and virtual mutation analysis techniques.
#' By default, specify that the calculation should use the effectsize_accurate function for calculating the statistic.
#' @export

analyse_vargha_delaney_effect_size <- function(d) {
  analyse_vargha_delaney_effect_size_specify(d, effectsize_accurate)
}

#' FUNCTION: analyse_vargha_delaney_effect_size_thresholding
#'

#' Perform an effect size analysis of the timings for the standard and virtual mutation analysis techniques.
#' By default, specify that the calculation should use the effectsize_accurate function for calculating the statistic.
#' But, investigate the effect size with different levels of thresholding, to establish sensitivity.
#' @export

analyse_vargha_delaney_effect_size_thresholding <- function(d) {
  for(threshold in seq(0, 1000, by=100)) {
    dt <-transform_execution_times_for_threshold(d, threshold)
    analyse_vargha_delaney_effect_size_specify(dt, effectsize_accurate) %>% str()
  }
}
