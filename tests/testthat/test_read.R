### Context: test cases for reading in the data files
context("read")

test_that("The time constrained mutation data file has a total of 1440 rows of data", {
  d <- read_time_constrained_mutation_data()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(nrow(d), equals(ns*nd*nt))
})

