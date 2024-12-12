#' Compute All Important Statistics
#'
#' This function computes key descriptive statistics for a numeric vector, including
#' measures of central tendency, variability, and percentiles.
#' These results can inform a user's choice of statistical analysis, especially for those that require information on dispersion.
#'
#' @param x a numeric vector for which to compute key statistics.
#'
#' @return A formatted table displaying the computed statistics:
#' \item{Mean}{The average of the values.}
#' \item{Variance}{The variance of the values.}
#' \item{StDev}{The standard deviation of the values.}
#' \item{Min}{The minimum value in the vector.}
#' \item{Max}{The maximum value in the vector.}
#' \item{Median}{The median of the values.}
#' \item{25th Percentile}{The first quartile (Q1) of the values.}
#' \item{75th Percentile}{The third quartile (Q3) of the values.}
#' \item{Coefficient_of_Variation}{The standard deviation divided by the mean, representing relative variability.}
#'
#' @examples
#' data <- c(1, 10, 5, 3, 7, 18)
#' stats(data)
#'
#' @export
stats <- function(x){

  # Making sure the column is numeric
  if (!is.numeric(x)) {
    stop("Column is not numeric. Please review your class of data for mistakes and try again.")
  }

  # Computing stats
  list_of_stats <- data.frame(
    Mean = mean(x, na.rm = TRUE),
    Variance = stats::var(x, na.rm = TRUE),
    StDev = stats::sd(x, na.rm = TRUE),
    Min = min(x, na.rm = TRUE),
    Max = max(x, na.rm = TRUE),
    `25th Percentile` = stats::quantile(x, 0.25, na.rm = TRUE),
    Median = stats::median(x, na.rm = TRUE),
    `75th Percentile` = stats::quantile(x, 0.75, na.rm = TRUE),
    Coefficient_of_Variation = ifelse(mean(x, na.rm = TRUE) != 0,
                                      stats::sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE),
                                      NA)
  )

  # Printing the table
  kableExtra::kable(list_of_stats)
}
