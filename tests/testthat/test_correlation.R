### Context: test cases for checking the correlations
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

test_that("The correlation tests returns a p-value of zero for the time constrained data", {
  d <- read_time_constrained_mutation_data()
  corr <- calculate_mutation_score_correlation(d)
  expect_that(corr$estimate, is_less_than(1))
  expect_that(corr$estimate, is_more_than(0))
})

