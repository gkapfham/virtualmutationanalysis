### Context: test cases for subsetting the data frames
context("subset-original-and-virtual")

test_that("Subsetting the data leaves only the avsDefaults datagenerator - original", {
  d <- read_original_mutation_data()
  ds <- d %>% subset_data_generator()
  dsd <- ds %>% select(datagenerator) %>% filter(datagenerator %in% c("avsDefaults"))  %>% unique()
  expect_that(nrow(dsd), equals(1))
})

test_that("Subsetting the data leaves only the avsDefaults datagenerator - virtual", {
  d <- read_virtual_mutation_data()
  ds <- d %>% subset_data_generator()
  dsd <- ds %>% select(datagenerator) %>% filter(datagenerator %in% c("avsDefaults"))  %>% unique()
  expect_that(nrow(dsd), equals(1))
})

test_that("Subsetting the data leaves only the chosen schemas for the AST 2016 paper - original", {
  d <- read_original_mutation_data()
  m <- read_time_constrained_mutation_data()
  ds <- subset_chosen_schemas(d, m)
  dss <- ds %>% select(schema) %>% unique()
  expect_that(nrow(dss), equals(16))
})

test_that("Subsetting the data leaves only the chosen schemas for the AST 2016 paper - virtual", {
  d <- read_virtual_mutation_data()
  m <- read_time_constrained_mutation_data()
  ds <- subset_chosen_schemas(d, m)
  dss <- ds %>% select(schema) %>% unique()
  expect_that(nrow(dss), equals(16))
})

test_that("Subsetting the data leaves only the correct and chosen schemas for the AST 2016 paper - virtual", {
  d <- read_virtual_mutation_data()
  m <- read_time_constrained_mutation_data()
  ds <- subset_chosen_schemas(d, m)
  dss <- ds %>% select(schema) %>% unique()
  expect_that(nrow(dss), equals(16))
  dss_pipeline <- subset_correct_pipeline_schemas(ds, ds) %>% select(schema) %>% unique()
  expect_that(nrow(dss_pipeline), equals(9))
})

test_that("Subsetting the data leaves only the correct and chosen schemas for the AST 2016 paper - original", {
  dv <- read_virtual_mutation_data()
  do <- read_original_mutation_data()
  m <- read_time_constrained_mutation_data()
  ds <- subset_chosen_schemas(do, m)
  dss <- ds %>% select(schema) %>% unique()
  expect_that(nrow(dss), equals(16))
  dss_pipeline <- subset_correct_pipeline_schemas(ds, dv) %>% select(schema) %>% unique()
  expect_that(nrow(dss_pipeline), equals(9))
})

### Context: test cases for subsetting the data frames
context("subset-original-dbmss")

test_that("Subsetting out the identifier attribute removes it from the data frame", {
  d <- read_original_mutation_data_postgres_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  expect_that(ncol(d), equals(5))
})

test_that("Subsetting out the identifier attribute removes it from the data frame", {
  d <- read_original_mutation_data_hypersql_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  expect_that(ncol(d), equals(5))
})

test_that("Subsetting out the identifier attribute removes it from the data frame", {
  d <- read_original_mutation_data_sqlite_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  expect_that(ncol(d), equals(5))
})

