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
  # compute the median and mean time values for both original and virtual
  ds <- d %>% dplyr::group_by(schema, dbms, technique) %>%
    dplyr::summarise(mediantime=median(mutationanalysistime),
                      meantime=mean(mutationanalysistime))
  # extract the data values for the original technique and make new separate columns
  dso <- ds %>% dplyr::filter(technique %in% c("Original")) %>%
    dplyr::select(meantime, mediantime) %>%
    dplyr::mutate(meantimeo=meantime, mediantimeo=mediantime) %>%
    dplyr::select(-meantime, -mediantime)
  # extract the data values for the virtual technique and make new separate columns
  dsv <- ds %>% dplyr::filter(technique %in% c("Virtual")) %>%
    dplyr::select(meantime, mediantime) %>%
    dplyr::mutate(meantimev=meantime, mediantimev=mediantime) %>%
    dplyr::select(-meantime, -mediantime)
  # combine these two new (admittedly "non-tidy") data frames to make a new joined data frame
  # add in "winner" attributes, making checking of the data very easy to complete
  dsov <- dplyr::right_join(dso, dsv, by = c("schema" = "schema", "dbms" = "dbms")) %>%
    dplyr::mutate(meanwinner=ifelse(meantimeo>meantimev, "Original", "Virtual")) %>%
    dplyr::mutate(medianwinner=ifelse(mediantimeo>mediantimev, "Original", "Virtual"))
  return(dsov)
}
