#' FUNCTION: summarise_unique_attributes
#'
#' Renames the mutation data so that it uses the correct attribute names.
#' @importFrom magrittr %>%
#' @export

summarise_unique_attributes <- function(d) {
  # summarise_each makes it easier to see the unique levels for each attribute
  d %>% summarise_each(funs(n_distinct)) %>% glimpse()
}
