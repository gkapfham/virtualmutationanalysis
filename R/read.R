#' FUNCTION: read_mutant_selection_data
#'
#' Read the data file that contains the "mutant sample" data. This is the data file that allows us to compare mutation
#' scores from the virtual mutation technique with scores when the original method is given the same amount of running
#' time. Note that this data file is provided by the R package through the extdata directory.
#' @export

read_mutant_selection_data <- function() {
  f = system.file("extdata", "mutant_selection.dat", package="virtualmutationanalysis")
  d = readr::read_csv(f)
  return(dplyr::tbl_df(d))
}
