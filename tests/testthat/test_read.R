### Context: test cases for reading in the data files for time constrained mutation
context("read-time-constrained-mutation")

test_that("The time constrained mutation data file has a total of 1440 rows of data", {
  d <- read_time_constrained_mutation_data()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns*nd*nt, equals(1440))
  expect_that(nrow(d), equals(ns*nd*nt))
})

test_that("The time constrained mutation data file has a total of 810 rows of data when subset", {
  d <- read_time_constrained_mutation_data_subset()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns*nd*nt, equals(810))
  expect_that(nrow(d), equals(ns*nd*nt))
})

test_that("The time constrained mutation data file has a total of 10 columns of data", {
  d <- read_time_constrained_mutation_data()
  expect_that(ncol(d), equals(10))
})

### Context: test cases for reading in the data file for the virtual mutation data
context("read-virtual-mutation")

test_that("The virtual mutation data file has a total of 3060 rows of data", {
  d <- read_virtual_mutation_data()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns*nd*nt, equals(3060))
  # the data file is missing data for six Schema/DBMS combinations (so 6*30 = 180 missing rows)
  expect_that(nrow(d), equals(3060 - (6*30)))
})

test_that("The virtual mutation data file (subset) has a total of 1440 (now 810) rows of data", {
  d <- read_virtual_mutation_data_subset()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns*nd*nt, equals(810))
  expect_that(nrow(d), equals(9*3*30))
})

### Context: test cases for reading in the data file for original mutation data
context("read-original-mutation")

test_that("The original mutation data file has a total of 3060 rows of data", {
  d <- read_original_mutation_data()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns*nd*nt, equals(3060))
  expect_that(nrow(d), equals(3060))
})

test_that("The original mutation data file (subset) has a total of 1440 (now 810) rows of data", {
  d <- read_original_mutation_data_subset()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  nt <- 30
  expect_that(ns, equals(9))
  expect_that(ns*nd*nt, equals(810))
  expect_that(nrow(d), equals(9*3*30))
})

### Context: test cases for reading in the data file for original mutation data (Postgres)
context("read-original-mutation-postgres")

test_that("The original mutation (Postgres) data file has a total of nine schemas and one dbms", {
  d <- read_original_mutation_data_postgres_subset()
  ns <- nrow(d %>% select(schema) %>% unique())
  nd <- nrow(d %>% select(dbms) %>% unique())
  expect_that(ns, equals(9))
  expect_that(nd, equals(1))
})


