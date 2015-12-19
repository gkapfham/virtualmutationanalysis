#' FUNCTION: read_time_constrained_mutation_data
#'
#' Read the data file that contains the "time-constrained mutation" data. This is the data file that allows us to
#' compare mutation scores from the virtual mutation technique with scores when the original method is given the same
#' amount of running time as virtual mutation. (Phil previously called this "mutant selection").
#' @export

read_time_constrained_mutation_data <- function() {
  f <- system.file("extdata", "time_constrained_mutation.dat", package="virtualmutationanalysis")
  d <- readr::read_csv(f)
  return(dplyr::tbl_df(d))
}

#' FUNCTION: read_virtual_mutation_data
#'
#' Read the data file that contains the "virtual mutation" data. This is the data file that contains the data about
#' virtual mutation (i.e., mutation using a model of the DBMS). Note that it contains data for more schemas than can
#' actually be used in the AST 2016 paper submission.
#' @export

read_virtual_mutation_data <- function() {
  f <- system.file("extdata", "virtual_mutation.dat", package="virtualmutationanalysis")
  d <- readr::read_csv(f)
  return(dplyr::tbl_df(d))
}
