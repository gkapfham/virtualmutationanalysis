### Context: test cases for subsetting the data frames
context("subset")

test_that("Subsetting the data leaves only the avsDefaults datagenerator", {
  d <- read_original_mutation_data()
  ds <- d %>% subset_data_generator()
  dsd <- ds %>% select(datagenerator) %>% filter(datagenerator %in% c("avsDefaults"))  %>% unique()
  expect_that(nrow(dsd), equals(1))
})

test_that("Subsetting the data leaves only the chosen schemas for the AST 2016 paper", {
  d <- read_original_mutation_data()
  m <- read_time_constrained_mutation_data()
  ds <- subset_chosen_schemas(d, m)
  dss <- ds %>% select(schema) %>% unique()
  expect_that(nrow(dss), equals(16))
})

