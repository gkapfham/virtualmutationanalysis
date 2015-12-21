### Context: test cases for subsetting the data frames
context("subset")

test_that("Subsetting the data leaves only the avsDefaults datagenerator", {
  d <- read_original_mutation_data()
  ds <- d %>% subset_data_generator()
  dsd <- ds %>% select(datagenerator) %>% filter(datagenerator %in% c("avsDefaults"))  %>% unique()
  expect_that(nrow(dsd), equals(1))
})

