#' FUNCTION: rename_mutation_for_attributes
#'
#' Renames the mutation data so that it uses the correct attribute names.
#' @importFrom magrittr %>%
#' @export

rename_mutation_for_attributes <- function(d) {
  # rename the casestudy attribute so that it is now called schema
  renamed_data <- d %>% rename(schema = casestudy)
  return(renamed_data)
}
