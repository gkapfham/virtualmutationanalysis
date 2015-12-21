#' FUNCTION: subset_data_generator
#'
#' Remove any data generator results not related to the avsDefaults generator
#' @importFrom magrittr %>%
#' @export

subset_data_generator <- function(d) {
  # remove all of the rows that are not for the avsDefaults data generator
  d %>% filter(datagenerator %in% c("avsDefaults"))
}

#' FUNCTION: subset_chosen_schemas
#'
#' Extract only those schemas that are part of the AST 2016 paper's empirical results.
#' @export

subset_chosen_schemas <- function(d, m) {
  # subset a provided data frame (like the one for virtual or original mutation) so that it only contains the
  # observations for the schemas present in the data frame called m (like the time constrained mutation data)
  ds <- semi_join(d, m, by="schema")
  return(ds)
}
