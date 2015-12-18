### Context: test cases for reading in the data files
context("read")

test_that("The time constrained mutation data file has a total of 960 !1080! rows of data", {
  d <- read_time_constrained_mutation_data()
  expect_that(nrow(d), equals(960))
})

