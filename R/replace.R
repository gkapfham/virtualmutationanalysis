#' FUNCTION: replace_original_technique
#'
#' Replace the original technique name in the original data set.
#' @importFrom magrittr %>%
#' @export

replace_original_technique <- function(d) {
  # replace the label "mutantTiming" with the label "Original"
  replaced_d <- d %>% mutate(technique=replace(technique=="mutantTiming", "Original"))
  return(renamed_data)
}
