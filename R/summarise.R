#' FUNCTION: summarise_unique_attributes
#'
#' Renames the mutation data so that it uses the correct attribute names.
#' @importFrom magrittr %>%
#' @export

summarise_unique_attributes <- function(d) {
  # summarise_each makes it easier to see the unique levels for each attribute
  d %>% dplyr::summarise_each(funs(dplyr::n_distinct)) %>% dplyr::glimpse()
}

#' FUNCTION: summarise_unique_attributes
#'
#' Renames the mutation data so that it uses the correct attribute names.
#' @importFrom magrittr %>%
#' @export

summarise_mutation_analysis <- function(d) {
  # summarise the data to get the analysis time for original and the denominator
  s = d %>% dplyr::group_by(identifier, schema, dbms) %>%
    dplyr::filter(type %in% c("NORMAL")) %>%
    dplyr::summarise(mutationanalysistime=sum(time), denominator=n()) %>%
    dplyr::ungroup()
  # summarise the data to get the numerator (note the extra filter on the killed status)
  n = d %>% dplyr::group_by(identifier, schema, dbms) %>%
    dplyr::filter(type %in% c("NORMAL")) %>%
    dplyr::filter(killed %in% c("true")) %>%
    dplyr::summarise(numerator=n()) %>%
    dplyr::ungroup()
  # join the two previous data frames together into a single data frame
  ns = dplyr::right_join(s, n, c("identifier" = "identifier", "schema" = "schema", "dbms" = "dbms"))
  return(ns)
}

