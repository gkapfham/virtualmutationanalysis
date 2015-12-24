### Context: test cases for creating the combined data frames across the three DBMSs
context("create-original-dbmss")

test_that("Combining the three data sets together yields the correct size data set", {
  hps <- create_original_data()
  expect_that(ncol(hps), equals(6))
  expect_that(nrow(hps), equals(270*3))
})

test_that("Creating the virtual data yields the correct size data set", {
  hps <- create_virtual_data()
  expect_that(ncol(hps), equals(6))
  expect_that(nrow(hps), equals(270*3))
})

