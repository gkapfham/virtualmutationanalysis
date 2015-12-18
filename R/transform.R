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
  tidy_data <- d %>%
    dplyr::select(one_of(c("dbms", "schema", "vm_score", "selection_score"))) %>%
    tidyr::gather(score_type, score, vm_score:selection_score) %>%
    dplyr::mutate(score_type = plyr::revalue(score_type, c(
            "vm_score" = "Virtual",
            "selection_score" = "Time-Constrained"
        )))
  return(tidy_data)
}
