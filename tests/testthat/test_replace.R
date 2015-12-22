### Context: test cases for reading in the data file for the virtual mutation data
context("replace-original-mutation")

test_that("Replacement on original mutation gives the correct technique name", {
  d <- read_original_mutation_data_subset()
  dr <- d %>% replace_original_technique()
  drw <- dr %>% filter(technique %in% c("mutantTiming")) %>% distinct()
  expect_that(nrow(drw), equals(0))
})

