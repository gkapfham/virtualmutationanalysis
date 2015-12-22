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

#' FUNCTION: read_time_constrained_mutation_data_subset
#'
#' Read the data file that contains the "time-constrained mutation" data. This is the data file that allows us to
#' compare mutation scores from the virtual mutation technique with scores when the original method is given the same
#' amount of running time as virtual mutation. (Phil previously called this "mutant selection").  Also, the data is
#' further subset to the 9 schemas that contain a consistent mutation pipeline through all experiments.
#' @export

read_time_constrained_mutation_data_subset <- function() {
  t <- system.file("extdata", "time_constrained_mutation.dat", package="virtualmutationanalysis")
  v <- system.file("extdata", "virtual_mutation.dat", package="virtualmutationanalysis")
  dt <- readr::read_csv(t)
  dv <- readr::read_csv(v) %>% rename_mutation_for_attributes()
  dct <- subset_correct_pipeline_schemas(dt, dv)
  return(dplyr::tbl_df(dct))
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
#' Then, the data is further subset to the 9 schemas that contain a consistent mutation pipeline through all experiments.
#' @importFrom magrittr %>%
#' @export

read_virtual_mutation_data_subset <- function() {
  v <- system.file("extdata", "virtual_mutation.dat", package="virtualmutationanalysis")
  t <- system.file("extdata", "time_constrained_mutation.dat", package="virtualmutationanalysis")
  dv <- readr::read_csv(v) %>% rename_mutation_for_attributes()
  dt <- readr::read_csv(t)
  dc <- subset_chosen_schemas(dv, dt)
  dcc <- subset_correct_pipeline_schemas(dc, dc) %>% replace_virtual_technique()
  return(dplyr::tbl_df(dcc))
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
#' Then, the data is further subset to the 9 schemas that contain a consistent mutation pipeline through all experiments.
#' @importFrom magrittr %>%
#' @export

read_original_mutation_data_subset <- function() {
  o <- system.file("extdata", "original_mutation.dat", package="virtualmutationanalysis")
  t <- system.file("extdata", "time_constrained_mutation.dat", package="virtualmutationanalysis")
  v <- system.file("extdata", "virtual_mutation.dat", package="virtualmutationanalysis")
  do <- readr::read_csv(o) %>% rename_mutation_for_attributes() %>% subset_data_generator()
  dv <- readr::read_csv(v) %>% rename_mutation_for_attributes()
  dt <- readr::read_csv(t)
  dc <- subset_chosen_schemas(do,dt)
  dcc <- subset_correct_pipeline_schemas(dc, dv) %>% replace_original_technique()
  return(dplyr::tbl_df(dcc))
}

#' FUNCTION: read_original_mutation_data_postgres_subset
#'
#' Read the data file that contains the "original mutation" data. This is the data file that contains the data about
#' original mutation (i.e., mutation that interacts with a DBMS), but only for the Postgres DBMS. This is the data file
#' that contains the correct timings for each of the individuals mutants that were run during the mutation analysis.
#' @importFrom magrittr %>%
#' @export

read_original_mutation_data_postgres_subset <- function() {
  o <- system.file("extdata", "postgres_original_mutation.dat", package="virtualmutationanalysis")
  t <- system.file("extdata", "time_constrained_mutation.dat", package="virtualmutationanalysis")
  v <- system.file("extdata", "virtual_mutation.dat", package="virtualmutationanalysis")
  do <- readr::read_csv(o)
  dv <- readr::read_csv(v) %>% rename_mutation_for_attributes()
  dt <- readr::read_csv(t)
  dc <- subset_chosen_schemas(do,dt)
  dcc <- subset_correct_pipeline_schemas(dc, dv)
  return(dplyr::tbl_df(dcc))
}

#' FUNCTION: read_original_mutation_data_hypersql_subset
#'
#' Read the data file that contains the "original mutation" data. This is the data file that contains the data about
#' original mutation (i.e., mutation that interacts with a DBMS), but only for the HyperSQL DBMS. This is the data file
#' that contains the correct timings for each of the individuals mutants that were run during the mutation analysis.
#' @importFrom magrittr %>%
#' @export

read_original_mutation_data_hypersql_subset <- function() {
  o <- system.file("extdata", "hypersql_original_mutation.dat", package="virtualmutationanalysis")
  t <- system.file("extdata", "time_constrained_mutation.dat", package="virtualmutationanalysis")
  v <- system.file("extdata", "virtual_mutation.dat", package="virtualmutationanalysis")
  do <- readr::read_csv(o)
  dv <- readr::read_csv(v) %>% rename_mutation_for_attributes()
  dt <- readr::read_csv(t)
  dc <- subset_chosen_schemas(do,dt)
  dcc <- subset_correct_pipeline_schemas(dc, dv)
  return(dplyr::tbl_df(dcc))
}

#' FUNCTION: read_original_mutation_data_sqlite_subset
#'
#' Read the data file that contains the "original mutation" data. This is the data file that contains the data about
#' original mutation (i.e., mutation that interacts with a DBMS), but only for the SQLite DBMS. This is the data file
#' that contains the correct timings for each of the individuals mutants that were run during the mutation analysis.
#' @importFrom magrittr %>%
#' @export

read_original_mutation_data_sqlite_subset <- function() {
  o <- system.file("extdata", "sqlite_original_mutation.dat", package="virtualmutationanalysis")
  t <- system.file("extdata", "time_constrained_mutation.dat", package="virtualmutationanalysis")
  v <- system.file("extdata", "virtual_mutation.dat", package="virtualmutationanalysis")
  do <- readr::read_csv(o)
  dv <- readr::read_csv(v) %>% rename_mutation_for_attributes()
  dt <- readr::read_csv(t)
  dc <- subset_chosen_schemas(do,dt)
  dcc <- subset_correct_pipeline_schemas(dc, dv)
  return(dplyr::tbl_df(dcc))
}
