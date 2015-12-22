### Context: test cases for reading in the data file for the virtual mutation data
context("replace-mutation-technique")

test_that("Replacement on original mutation does not give the old technique name", {
  d <- read_original_mutation_data_subset()
  dr <- d %>% replace_original_technique()
  drw <- dr %>% filter(technique %in% c("mutantTiming")) %>% select(technique) %>% distinct()
  expect_that(nrow(drw), equals(0))
})

test_that("Replacement on original mutation gives the correct technique name", {
  d <- read_original_mutation_data_subset()
  dr <- d %>% replace_original_technique()
  drw <- dr %>% filter(technique %in% c("Original")) %>% select(technique) %>% distinct()
  expect_that(nrow(drw), equals(1))
})

test_that("Replacement on virtual mutation does not gives the old technique name", {
  d <- read_virtual_mutation_data_subset()
  dr <- d %>% replace_virtual_technique()
  drw <- dr %>% filter(technique %in% c("virtual")) %>% select(technique) %>% distinct()
  expect_that(nrow(drw), equals(0))
})

test_that("Replacement on virtual mutation does gives the correct technique name", {
  d <- read_virtual_mutation_data_subset()
  dr <- d %>% replace_virtual_technique()
  drw <- dr %>% filter(technique %in% c("Virtual")) %>% select(technique) %>% distinct()
  expect_that(nrow(drw), equals(1))
})

