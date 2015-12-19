### Context: test cases for reading in the data files
context("correlation")

test_that("The correlation test returns a single row of data for the time constrained data", {
  d <- read_time_constrained_mutation_data()
  corr <- calculate_mutation_score_correlation(d)
  expect_that(nrow(corr), equals(1))
})

test_that("The correlation tests returns a p-value of zero for the time constrained data", {
  d <- read_time_constrained_mutation_data()
  corr <- calculate_mutation_score_correlation(d)
  expect_that(corr$p.value, equals(0))
})

