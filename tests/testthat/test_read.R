### Context: test cases for reading in the data files
context("read")

test_that("The mutant_selection.dat file as a total of rows of data", {
  mutant_selection_data <- read_mutant_selection_data()
  expect_that(nrow(mutant_selection_data), equals(960))
})

