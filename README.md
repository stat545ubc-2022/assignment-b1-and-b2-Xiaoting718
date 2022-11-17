
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SummarizeByGroup

<!-- badges: start -->
<!-- badges: end -->

The goal of SummarizeByGroup is to summarize statistical features of a
numerical column in the given data by group.

## Installation

You can install the development version of SummarizeByGroup from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-Xiaoting718")
```

## Example

This is a basic example which shows you how to summarize statistical
features of radius_mean in cancer_sample:

``` r
library(dplyr)
#> 
#> 载入程辑包：'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(datateachr)
library(SummarizeByGroup)
summarize_by_group(cancer_sample, diagnosis, radius_mean)
#> # A tibble: 2 × 6
#>   diagnosis  mean range   max   min    sd
#>   <chr>     <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 B          12.1  10.9  17.8  6.98  1.78
#> 2 M          17.5  17.2  28.1 11.0   3.20
```
