### Context: test cases for combining the data frames
context("combine-original-dbmss")

test_that("Combining the three data sets together yields the correct size data set", {
  h <- read_original_mutation_data_hypersql_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  p <- read_original_mutation_data_postgres_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  s <- read_original_mutation_data_sqlite_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  hps <- combine_dbms_data(h, p, s)
  expect_that(ncol(h), equals(5))
  expect_that(ncol(p), equals(5))
  expect_that(ncol(s), equals(5))
  expect_that(nrow(h), equals(270))
  expect_that(nrow(p), equals(270))
  expect_that(nrow(s), equals(270))
  expect_that(nrow(hps), equals(270*3))
})

