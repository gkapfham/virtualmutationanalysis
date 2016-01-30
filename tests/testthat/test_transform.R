### Context: test cases for transforming data frames
context("transform-mutation-scores")

test_that("The transformed data frame no longer contains certain attributes", {
  d <- read_time_constrained_mutation_data()
  dt <- transform_time_constrained_data_for_scores(d)
  dc <- dt %>% select(contains("vm_time"))
  expect_that(ncol(dc), equals(0))
  dc <- dt %>% select(contains("selection_time"))
  expect_that(ncol(dc), equals(0))
})

test_that("The transformed data frame now contains certain attributes", {
  d <- read_time_constrained_mutation_data()
  dt <- transform_time_constrained_data_for_scores(d)
  dc <- dt %>% select(contains("score_type"))
  expect_that(ncol(dc), equals(1))
  dc <- dt %>% select(one_of(c("score")))
  expect_that(ncol(dc), equals(1))
})

test_that("The transformed data frame always contains certain attributes", {
  d <- read_time_constrained_mutation_data()
  dt <- transform_time_constrained_data_for_scores(d)
  dc <- dt %>% select(contains("schema"))
  expect_that(ncol(dc), equals(1))
  dc <- dt %>% select(one_of(c("dbms")))
  expect_that(ncol(dc), equals(1))
})

### Context: test cases for transforming data frames for total values
context("transform-totals")

test_that("The transformed data frame no longer contains certain attributes", {
  d <- read_time_constrained_mutation_data()
  dt <- transform_time_constrained_data_for_totals(d)
  dc <- dt %>% select(contains("vm_total"))
  expect_that(ncol(dc), equals(0))
  dc <- dt %>% select(contains("selection_total"))
  expect_that(ncol(dc), equals(0))
})

test_that("The transformed data frame now contains certain attributes", {
  d <- read_time_constrained_mutation_data()
  dt <- transform_time_constrained_data_for_totals(d)
  dc <- dt %>% select(contains("total_type"))
  expect_that(ncol(dc), equals(1))
  dc <- dt %>% select(one_of(c("total")))
  expect_that(ncol(dc), equals(1))
})

test_that("The transformed data frame always contains certain attributes", {
  d <- read_time_constrained_mutation_data()
  dt <- transform_time_constrained_data_for_totals(d)
  dc <- dt %>% select(contains("schema"))
  expect_that(ncol(dc), equals(1))
  dc <- dt %>% select(one_of(c("dbms")))
  expect_that(ncol(dc), equals(1))
})

test_that("The transformed data frame contains the correct number of rows", {
  d <- read_time_constrained_mutation_data()
  dt <- transform_time_constrained_data_for_totals(d)
  expect_that(nrow(dt), equals(16*3*2))
})

### Context: test cases for transforming data frames for mutation times
context("transform-mutation-times")

test_that("The transformed data frame no longer contains certain attributes", {
  d <- read_virtual_mutation_data_subset()
  expect_that(ncol(d), equals(7))
  dt <- d %>% transform_virtual_mutation_time()
  expect_that(ncol(dt), equals(6))
})

### Context: test cases for transforming data frames for thresholding in mutation analysis times
context("transform-mutationtime-thresholding")

test_that("After thresholding there are only zeros when the value was below 100 ms", {
  d <- create_original_and_virtual_data()
  expect_that(ncol(d), equals(6))
  dempty <- d %>% filter(mutationanalysistime < 100) %>% filter(mutationanalysistime == 0)
  expect_that(nrow(dempty), equals(0))
  dt <- d %>% transform_execution_times_for_threshold_default()
  expect_that(ncol(dt), equals(6))
  dempty <- dt %>% filter(mutationanalysistime < 100) %>% filter(mutationanalysistime != 0)
  expect_that(nrow(dempty), equals(0))
})

test_that("After thresholding there are only zeros when the value was below 500 ms", {
  d <- create_original_and_virtual_data()
  expect_that(ncol(d), equals(6))
  dempty <- d %>% filter(mutationanalysistime < 500) %>% filter(mutationanalysistime == 0)
  expect_that(nrow(dempty), equals(0))
  dt <- d %>% transform_execution_times_for_threshold(500)
  expect_that(ncol(dt), equals(6))
  dempty <- dt %>% filter(mutationanalysistime < 500) %>% filter(mutationanalysistime != 0)
  expect_that(nrow(dempty), equals(0))
})

test_that("After truncation thresholding there are only zeros when the value was below 100 ms", {
  d <- create_original_and_virtual_data()
  expect_that(ncol(d), equals(6))
  dempty <- d %>% filter(mutationanalysistime < 100) %>% filter(mutationanalysistime == 0)
  expect_that(nrow(dempty), equals(0))
  dt <- d %>% transform_truncate_execution_times_for_precision(-2)
  expect_that(ncol(dt), equals(6))
  dempty <- dt %>% filter(mutationanalysistime < 100) %>% filter(mutationanalysistime != 0)
  expect_that(nrow(dempty), equals(0))
})

