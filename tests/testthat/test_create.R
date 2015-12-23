### Context: test cases for creating the combined data frames across the three DBMSs
context("create-original-dbmss")

test_that("Combining the three data sets together yields the correct size data set", {
  hps <- create_original_data()
  expect_that(nrow(hps), equals(270*3))
})

