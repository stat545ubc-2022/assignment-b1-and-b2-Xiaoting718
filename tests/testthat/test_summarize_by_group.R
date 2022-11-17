suppressPackageStartupMessages(library(datateachr))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tibble))

test_that("Input validation in summarize_by_group", {
  expect_error(summarize_by_group(cancer_sample, diagnosis, radius_me))
  expect_error(summarize_by_group(cancer_sample, NA, fractal_dimension_mean))
  expect_error(summarize_by_group(numeric(0), NA, compactness_mean))
})

test_that("summarize_by_group outputs equal to known hash", {
  suppressWarnings(expect_known_hash(summarize_by_group(cancer_sample, diagnosis, radius_mean), "86b"))
  suppressWarnings(expect_known_hash(summarize_by_group(cancer_sample, diagnosis, smoothness_mean), "f9b"))
})
test_that("summarize_by_group output data type is tibble", {
  expect_true(tibble::is_tibble(summarize_by_group(cancer_sample, diagnosis, texture_mean)))
  expect_false(any(is.na(summarize_by_group(cancer_sample, diagnosis, compactness_mean))))
})

