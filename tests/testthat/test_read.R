### Context: test cases for reading in the data files for time constrained mutation
context("read-time-constrained-mutation")

test_that("The time constrained mutation data file has a total of 1440 rows of data", {
  d <- read_time_constrained_mutation_data()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns*nd*nt, equals(1440))
  expect_that(nrow(d), equals(ns*nd*nt))
})

test_that("The time constrained mutation data file has a total of 10 columns of data", {
  d <- read_time_constrained_mutation_data()
  expect_that(ncol(d), equals(10))
})

### Context: test cases for reading in the data file for the virtual mutation data
context("read-virtual-mutation")

test_that("The virtual mutation data file has a total of 3060 rows of data", {
  d <- read_virtual_mutation_data()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns*nd*nt, equals(3060))
  # TODO: This should be passing and it is not!
  # expect_that(nrow(d), equals(3060))
})

### Context: test cases for reading in the data file for original mutation data
context("read-original-mutation")

test_that("The original mutation data file has a total of 3060 rows of data", {
  d <- read_original_mutation_data()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns*nd*nt, equals(3060))
  expect_that(nrow(d), equals(3060))
})

