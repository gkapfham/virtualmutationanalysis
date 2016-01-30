#' FUNCTION: transform_time_constrained_data_for_scores
#'
#' Transform the data that contains the virtual mutation scores and the time-constrained mutation scores so that they
#' are "tidy" in format and thus easily amenable to visualization and analysis.
#' @importFrom magrittr %>%
#' @export

transform_time_constrained_data_for_scores <- function(d) {
  # go from data that is column-oriented to row-oriented
  # change the name of the values to be better for graphing
  tidy_data <- d %>%
    dplyr::select(one_of(c("dbms", "schema", "vm_score", "selection_score"))) %>%
    tidyr::gather(score_type, score, vm_score:selection_score) %>%
    dplyr::mutate(score_type = plyr::revalue(score_type, c(
            "vm_score" = "Virtual",
            "selection_score" = "Time-Constrained"
            ))) %>%
    dplyr::mutate(dbms = plyr::revalue(dbms, c(
            "Postgres" = "PostgreSQL"
            )))
  return(tidy_data)
}

#' FUNCTION: transform_time_constrained_data_for_totals
#'
#' Transform the data that contains the virtual mutation total count and the time-constrained mutation total count so
#' that they are "tidy" in format and thus easily amenable to visualization and analysis.
#' @importFrom magrittr %>%
#' @export

transform_time_constrained_data_for_totals <- function(d) {
  # go from data that is column-oriented to row-oriented
  # change the name of the values to be better for graphing
  # summarise and group_by the data to prepare for a bar plot geom
  # ungroup the data so that can be access correctly later on
  tidy_data <- d %>%
    dplyr::select(one_of(c("dbms", "schema", "vm_total", "selection_total"))) %>%
    tidyr::gather(total_type, total, vm_total:selection_total) %>%
    dplyr::mutate(total_type = plyr::revalue(total_type, c(
            "vm_total" = "Virtual",
            "selection_total" = "Time-Constrained"
            ))) %>%
    dplyr::mutate(dbms = plyr::revalue(dbms, c(
            "Postgres" = "PostgreSQL"
            ))) %>%
  dplyr::group_by(dbms, schema, total_type) %>% summarise(total=mean(total)) %>%
    ungroup()
  return(tidy_data)
}

#' FUNCTION: transform_virtual_mutation_time
#'
#' Transform the virtual mutation data file so that it is has a single attribute for mutation analysis time.
#' @importFrom magrittr %>%
#' @export

transform_virtual_mutation_time <- function(d) {
  # compute the mutation analysis time according to the given formula, that is both "original" and "mutation" analysis
  dt <- d %>% dplyr::mutate(mutationanalysistime = originalresultstime + mutationanalysistime)
  # delete the old "originalresultstime" attribute as it is no longer needed and is incompatible with the original data
  dts <- dt %>% dplyr::select(-originalresultstime)
  return(dts)
}

#' FUNCTION: transform_mutation_time_savings
#'
#' Transform the combined data file so that it has a new attribute about the savings of using virtual mutation.
#' @importFrom magrittr %>%
#' @export

transform_mutation_time_savings <- function(d, o) {
  # calculate the savings and percentage savings associated with using virtual instead of original
  ds <- d %>%
    dplyr::group_by(technique,schema,dbms) %>%
    dplyr::summarise(time = mean(mutationanalysistime)) %>%
    tidyr::spread(technique,time) %>%
    dplyr::mutate(
           saving = Standard - Virtual,
           saving_percent = (Standard - Virtual) / Standard
           )
  # extract only the scoredenominator and the attributes needed for joining which the previously constructed data frame
  dl <- d %>% dplyr::select(-mutationanalysistime, -scorenumerator, -technique) %>%
    dplyr::group_by(dbms, schema) %>% dplyr::distinct() %>%
    dplyr::rename(mutantcount = scoredenominator)
  # join these two data frames together so that we have savings and the number of mutants in the data frame
  dsmc <- dplyr::right_join(ds, dl, c("schema" = "schema", "dbms" = "dbms"))
  # extract only the tests and the attributes needed for joining from the other provided data frame
  ol <- o %>% dplyr::select(tests, dbms, schema) %>%
    dplyr::group_by(dbms, schema) %>% dplyr::distinct() %>%
    dplyr::rename(testcount = tests)
  # join these two data frames together so that we have savings and the number of mutants in the data frame
  dsmct <- dplyr::right_join(dsmc, ol, c("schema" = "schema", "dbms" = "dbms"))
  return(dsmct)
}

#' FUNCTION: transform_execution_times_for_threshold_default

#' Transform the timing values so that they do not include any below 100 ms. This is the widely agreed on
#' value below which a human cannot perceive differences (see the SSBSE 2015 paper for support for this statement).
#' @importFrom magrittr %>%
#' @export

transform_execution_times_for_threshold_default <- function(d) {
  return(transform_execution_times_for_threshold(d, 100))
}

#' FUNCTION: transform_execution_times_for_threshold

#' Transform the timing values so that they do not include any below a specified number of ms.
#' @importFrom magrittr %>%
#' @export

transform_execution_times_for_threshold <- function(d, t) {
  td <- d %>%
    dplyr::mutate(mutationanalysistime=ifelse(mutationanalysistime<t, 0, mutationanalysistime))
  return(td)
}

#' FUNCTION: transform_truncate_execution_times_for_precision

#' Transform the timing values so that they do not include any below a specified number of ms.
#' @importFrom magrittr %>%
#' @export

transform_truncate_execution_times_for_precision <- function(d, p) {
  # trunc(x*10^4)/10^4
  td <- d %>%
    dplyr::mutate(mutationanalysistime=base::trunc(mutationanalysistime*10^p)/10^p)
  return(td)
}
