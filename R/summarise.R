#' FUNCTION: summarise_unique_attributes
#'
#' Summarises the unique attributes, primarily used for debugging.
#' @importFrom magrittr %>%
#' @export

summarise_unique_attributes <- function(d) {
  # summarise_each makes it easier to see the unique levels for each attribute
  d %>% dplyr::summarise_each(funs(dplyr::n_distinct)) %>% dplyr::glimpse()
}

#' FUNCTION: summarise_mutation_analysis
#'
#' Summarise an entire data frame (for a single DBMS) to accumulate the required data for the "original" technique.
#' @importFrom magrittr %>%
#' @export

summarise_mutation_analysis <- function(d) {
  # summarise the data to get the analysis time for original and the denominator
  s = d %>% dplyr::group_by(identifier, schema, dbms) %>%
    dplyr::filter(type %in% c("NORMAL")) %>%
    dplyr::summarise(mutationanalysistime=sum(time), scoredenominator=n()) %>%
    dplyr::ungroup()
  # summarise the data to get the numerator (note the extra filter on the killed status)
  n = d %>% dplyr::group_by(identifier, schema, dbms) %>%
    dplyr::filter(type %in% c("NORMAL")) %>%
    dplyr::filter(killed %in% c("true")) %>%
    dplyr::summarise(scorenumerator=n()) %>%
    dplyr::ungroup()
  # join the two previous data frames together into a single data frame
  ns = dplyr::right_join(s, n, c("identifier" = "identifier", "schema" = "schema", "dbms" = "dbms"))
  return(ns)
}

#' FUNCTION: summarise_mutation_analysis_time
#'
#' Summarise the mutation timing values for both the original and the virtual techniques, supporting comparisons.
#' @importFrom magrittr %>%
#' @export

summarise_mutation_analysis_time <- function(d) {
  # summarise_each makes it easier to see the unique levels for each attribute
  ds <- d %>% dplyr::group_by(schema, dbms, technique) %>%
    dplyr::summarise(medianmutationanalysistime=median(mutationanalysistime),
                      meanmutationanalysistime=mean(mutationanalysistime))
  return(ds)
}


