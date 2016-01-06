### Context: test cases for summarising the original data sets
context("summarise-original-postgres")

test_that("The summarised original data set for Postgres has 270 rows", {
  d <- read_original_mutation_data_postgres_subset() %>% summarise_mutation_analysis()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns*nd*nt, equals(270))
  expect_that(nrow(d), equals(ns*nd*nt))
})

test_that("The summarised original data set for Postgres has 6 columns", {
  d <- read_original_mutation_data_postgres_subset() %>% summarise_mutation_analysis()
  expect_that(ncol(d), equals(6))
})

### Context: test cases for summarising the original data sets
context("summarise-original-hypersql")

test_that("The summarised original data set for HyperSQL has 270 rows", {
  d <- read_original_mutation_data_hypersql_subset() %>% summarise_mutation_analysis()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns*nd*nt, equals(270))
  expect_that(nrow(d), equals(ns*nd*nt))
})

test_that("The summarised original data set for HyperSQL has 6 columns", {
  d <- read_original_mutation_data_hypersql_subset() %>% summarise_mutation_analysis()
  expect_that(ncol(d), equals(6))
})

### Context: test cases for summarising the original data sets
context("summarise-original-sqlite")

test_that("The summarised original data set for SQLite has 270 rows", {
  d <- read_original_mutation_data_sqlite_subset() %>% summarise_mutation_analysis()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns*nd*nt, equals(270))
  expect_that(nrow(d), equals(ns*nd*nt))
})

test_that("The summarised original data set for SQLite has 6 columns", {
  d <- read_original_mutation_data_sqlite_subset() %>% summarise_mutation_analysis()
  expect_that(ncol(d), equals(6))
})

### Context: test cases for summarising the combined original and virtual data sets
context("summarise-original-and-virtual")

test_that("The summarised original data set for SQLite has 270 rows", {
  d <- create_original_and_virtual_data() %>% summarise_mutation_analysis_time()
  ns <- 9
  nd <- 3
  expect_that(ns*nd, equals(27))
  expect_that(nrow(d), equals(ns*nd))
})
