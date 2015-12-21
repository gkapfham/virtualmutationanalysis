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
#' actually be used in the AST 2016 paper submission; this is due to both the fact that we do not have time constrained
#' mutation for many of the schemas and because some schemas use multiple mutation pipelines.
#' @importFrom magrittr %>%
#' @export

read_virtual_mutation_data <- function() {
  f <- system.file("extdata", "virtual_mutation.dat", package="virtualmutationanalysis")
  d <- readr::read_csv(f) %>% rename_mutation_for_attributes()
  return(dplyr::tbl_df(d))
}

#' FUNCTION: read_virtual_mutation_data_subset
#'
#' Read the data file that contains the "virtual mutation" data. This is the data file that contains the data about
#' virtual mutation (i.e., mutation using a model of the DBMS). Data has been subset for the 16 chosen schemas for AST 2016.
#' @importFrom magrittr %>%
#' @export

read_virtual_mutation_data_subset <- function() {
  f <- system.file("extdata", "virtual_mutation.dat", package="virtualmutationanalysis")
  m <- system.file("extdata", "time_constrained_mutation.dat", package="virtualmutationanalysis")
  df <- readr::read_csv(f) %>% rename_mutation_for_attributes()
  dm <- readr::read_csv(m)
  df <- subset_chosen_schemas(df,dm)
  return(dplyr::tbl_df(df))
}

#' FUNCTION: read_original_mutation_data
#'
#' Read the data file that contains the "original mutation" data. This is the data file that contains the data about
#' original mutation (i.e., mutation that interacts with a DBMS). Note that it contains data for more schemas than can
#' actually be used in the AST 2016 paper submission.
#' @importFrom magrittr %>%
#' @export

read_original_mutation_data <- function() {
  f <- system.file("extdata", "original_mutation.dat", package="virtualmutationanalysis")
  # 1. Read the CSV data file, 2. Use the standard naming convention, 3. Only use the avsDefaults data generator
  d <- readr::read_csv(f) %>% rename_mutation_for_attributes() %>% subset_data_generator()
  return(dplyr::tbl_df(d))
}

#' FUNCTION: read_original_mutation_data_subset
#'
#' Read the data file that contains the "original mutation" data. This is the data file that contains the data about
#' original mutation (i.e., mutation that interacts with a DBMS). Data has been subset for the 16 chosen schemas for AST 2016.
#' @importFrom magrittr %>%
#' @export

read_original_mutation_data_subset <- function() {
  f <- system.file("extdata", "original_mutation.dat", package="virtualmutationanalysis")
  m <- system.file("extdata", "time_constrained_mutation.dat", package="virtualmutationanalysis")
  df <- readr::read_csv(f) %>% rename_mutation_for_attributes() %>% subset_data_generator()
  dm <- readr::read_csv(m)
  df <- subset_chosen_schemas(df,dm)
  return(dplyr::tbl_df(df))
}
