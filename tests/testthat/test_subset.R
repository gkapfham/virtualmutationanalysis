### Context: test cases for subsetting the data frames
context("correlation")

test_that("Subsetting the data leaves only the avsDefaults datagenerator", {
  d <- read_original_mutation_data()
  ds <- d %>% subset_data_generator()
  dsd <- ds %>% filter(datagenerator %in% c("avsDefaults")) %>% unique()
  expect_that(nrow(dsd), equals(1))
})

