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

### Context: test cases for reading in the data files for time constrained mutation
context("read-virtual-mutation")

# test_that("The virtual mutation data file has a total of 2880 rows of data", {
#   d <- read_virtual_mutation_data()
#   ns <- nrow(d %>% select(schema) %>% unique())
#   nd <- nrow(d %>% select(dbms) %>% unique())
#   nt <- 30
#   expect_that(ns*nd*nt, equals(2880))
#   expect_that(nrow(d), equals(ns*nd*nt))
# })

