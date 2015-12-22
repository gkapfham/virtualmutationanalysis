#' FUNCTION: replace_original_technique
#'
#' Replace the original technique name in the original data set with a name that is properly descriptive.
#' @importFrom magrittr %>%
#' @export

replace_original_technique <- function(d) {
  # replace the label "mutantTiming" with the label "Original"
  replaced_d <- d %>% mutate(technique = factor(technique)) %>%
    mutate(technique = revalue(technique, c("mutantTiming" = "Original")))
  return(replaced_d)
}

#' FUNCTION: replace_virtual_technique
#'
#' Replace the virtual technique name in the original data set with a name that is capitalized.
#' @importFrom magrittr %>%
#' @export

replace_virtual_technique <- function(d) {
  # replace the label "virtual" with the label "Virtual"
  replaced_d <- d %>% mutate(technique = factor(technique)) %>%
    mutate(technique = revalue(technique, c("virtual" = "Virtual")))
  return(replaced_d)
}
