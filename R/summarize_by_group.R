#' @title Summarize numerical column statistical features by group
#' @details
#' Summarize statistical features of a numerical column in the data by group.
#' @param data A data frame contains data to be analyzed.
#' @param group the name of the variable that needs to group by.
#' @param column the name of the column to be summarized.
#' @return A tibble that contains summarized statistical features of given column by group.
#' @export
#'
#' @examples
#' library(datateachr)
#' library(dplyr)
#' summarize_by_group(cancer_sample, diagnosis, radius_mean)
summarize_by_group <- function (data, group, column) {

  # check if the data is data frame type
  stopifnot(is.data.frame(data))

  # convert input column into string name
  group_name <- rlang::as_label(rlang::enquo(group))
  column_name <- rlang::as_label(rlang::enquo(column))

  # check existence of given columns
  if (!(group_name %in% colnames(data)))
    stop("'", group_name, "' does not exist in the data")

  if (!(column_name %in% colnames(data)))
    stop("'", column_name, "' does not exist in the data")

  # get column data type
  column_type <- data %>% dplyr::select({{column}}) %>% dplyr::summarize_all(class)

  # check whether the column is numeric
  if (column_type[[1]] != "numeric")
    stop("'", column_name, "' data type must be numeric")

  # summarize statistical features of the column per group
  data %>% dplyr::group_by({{ group }}) %>% dplyr::summarize(mean = mean({{ column }}),
            range=max({{ column }}) - min({{ column }}), max=max({{ column }}),
            min=min({{ column }}), sd=stats::sd({{ column }}))
}
