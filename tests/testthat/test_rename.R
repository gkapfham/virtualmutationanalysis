### Context: test cases for renaming attributes in a data frame
context("rename")

test_that("It works to rename the casestudy attribute to the schema attribute", {
  # note that the renaming happens when calling the read_original_mutation_data function
  d <- read_original_mutation_data()
  dc <- d %>% select(contains("schema"))
  expect_that(ncol(dc), equals(1))
  dc <- d %>% select(contains("casestudy"))
  expect_that(ncol(dc), equals(0))
})

