#' FUNCTION: subset_data_generator
#'
#' Remove any data generator results not related to the avsDefaults generator
#' @importFrom magrittr %>%
#' @export

subset_data_generator <- function(d) {
  # remove all of the rows that are not for the avsDefaults data generator
  d %>% filter(datagenerator %in% c("avsDefaults"))
}
