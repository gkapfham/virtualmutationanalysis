### Context: test cases for reading in the data file for the virtual mutation data
context("replace-mutation-technique")

test_that("Replacement on original mutation gives the correct technique name", {
  d <- read_original_mutation_data_subset()
  dr <- d %>% replace_original_technique()
  drw <- dr %>% filter(technique %in% c("mutantTiming")) %>% distinct()
  expect_that(nrow(drw), equals(0))
})

test_that("Replacement on virtual mutation gives the correct technique name", {
  d <- read_virtual_mutation_data_subset()
  dr <- d %>% replace_virtual_technique()
  drw <- dr %>% filter(technique %in% c("virtual")) %>% distinct()
  expect_that(nrow(drw), equals(0))
})

