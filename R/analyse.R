#' FUNCTION: analyse_wilcox_rank_sum_test
#'

#' Perform a statistical analysis of the timings for the standard and virtual mutation analysis techniques. Right now, this method
#' simply returns textual output; it would be much better if it actually returned a single data frame.
#' @importFrom magrittr %>%
#' @export

analyse_wilcox_rank_sum_test <- function(d) {
  # extract the relevant data values for the standard method
  standard_time <- d %>% dplyr::filter(technique %in% c("Standard"))

  # extract the relevant data values for the virtual method
  virtual_time <- d %>% dplyr::filter(technique %in% c("Virtual"))

  # extract and analyse the relevant data values for the HyperSQL database
  standard_time_hypersql <- analyse_extract_dbms_data(standard_time, "HyperSQL")
  virtual_time_hypersql <- analyse_extract_dbms_data(virtual_time, "HyperSQL")
  standard_time_hypersql %>% dplyr::distinct(dbms) %>% dplyr::select(dbms) %>% glimpse()
  analyse_perform_wilcox_rank_sum_test(standard_time_hypersql, virtual_time_hypersql) %>% glimpse()

  # extract and analyse the relevant data values for the PostgreSQL database
  standard_time_postgres <- analyse_extract_dbms_data(standard_time, "PostgreSQL")
  virtual_time_postgres <- analyse_extract_dbms_data(virtual_time, "PostgreSQL")
  standard_time_postgres %>% dplyr::distinct(dbms) %>% dplyr::select(dbms) %>% glimpse()
  analyse_perform_wilcox_rank_sum_test(standard_time_postgres, virtual_time_postgres) %>% glimpse()

  # extract and analyse the relevant data values for the SQLite database
  standard_time_sqlite <- analyse_extract_dbms_data(standard_time, "SQLite")
  virtual_time_sqlite <- analyse_extract_dbms_data(virtual_time, "SQLite")
  standard_time_sqlite %>% dplyr::distinct(dbms) %>% dplyr::select(dbms) %>% glimpse()
  analyse_perform_wilcox_rank_sum_test(standard_time_sqlite, virtual_time_sqlite) %>% glimpse()
}

#' FUNCTION: analyse_extract_dbms_data
#'

#' Perform a single Wilcoxon rank-sum test for two input data sets.
#' @importFrom magrittr %>%
#' @export

analyse_extract_dbms_data <- function(d,cdbms) {
  # extract the relevant data values for the specified database
  d_dbms <- d %>% dplyr::filter(dbms %in% c(cdbms))
  return(d_dbms)
}

#' FUNCTION: perform_wilcox_rank_sum_test
#'

#' Perform a single Wilcoxon rank-sum test for two input data sets.
#' @importFrom magrittr %>%
#' @export

analyse_perform_wilcox_rank_sum_test <- function(s,v) {
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

  # extract and analyse the relevant data values for the HyperSQL database
  standard_time_hypersql <- analyse_extract_dbms_data(standard_time, "HyperSQL")
  virtual_time_hypersql <- analyse_extract_dbms_data(virtual_time, "HyperSQL")
  standard_time_hypersql %>% dplyr::distinct(dbms) %>% dplyr::select(dbms) %>% glimpse()
  model <- e(virtual_time_hypersql$mutationanalysistime, standard_time_hypersql$mutationanalysistime)
  model %>% str()

  # extract and analyse the relevant data values for the PostgreSQL database
  standard_time_postgres <- analyse_extract_dbms_data(standard_time, "PostgreSQL")
  virtual_time_postgres <- analyse_extract_dbms_data(virtual_time, "PostgreSQL")
  standard_time_postgres %>% dplyr::distinct(dbms) %>% dplyr::select(dbms) %>% glimpse()
  model <- e(virtual_time_postgres$mutationanalysistime, standard_time_postgres$mutationanalysistime)
  model %>% str()

  # extract and analyse the relevant data values for the SQLite database
  standard_time_sqlite <- analyse_extract_dbms_data(standard_time, "SQLite")
  virtual_time_sqlite <- analyse_extract_dbms_data(virtual_time, "SQLite")
  standard_time_sqlite %>% dplyr::distinct(dbms) %>% dplyr::select(dbms) %>% glimpse()
  analyse_perform_wilcox_rank_sum_test(standard_time_sqlite, virtual_time_sqlite) %>% glimpse()
  model <- e(virtual_time_sqlite$mutationanalysistime, standard_time_sqlite$mutationanalysistime)
  model %>% str()
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
