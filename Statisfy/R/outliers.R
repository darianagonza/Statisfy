#' Easily Detect Outliers
#'
#' This function identifies outliers in a numeric dataset based on specified quantile thresholds.
#' The function takes in an upper and lower quantile to determine the bounds for detecting outliers and outputs a vector of outliers.
#'
#' @param data A numeric variable containing the data to be analyzed.
#' @param upper A numeric value (default = .99) indicating the upper quantile threshold for outlier detection.
#' @param lower A numeric value (default = .01) indicating the lower quantile threshold for outlier detection.
#'
#' @return A list containing: the lower bound, the upper bound, and a vector of values identified as outliers.
#'
#' @examples
#' data <- c(1, 5, 2, 14, 1, 50)
#' outliers(data, upper = 0.95, lower = 0.05)
#'
#' @export
outliers <- function(data, upper = .99, lower = .01){
  # Making sure data is numeric
  if (!is.numeric(data)) {
    stop("The input data must be numeric. Please review your data class for mistakes and try again.")
  }

  # Calculating thresholds
  upper_bound <- stats::quantile(data, probs = upper, na.rm = TRUE)
  lower_bound <- stats::quantile(data, probs = lower, na.rm = TRUE)

  # Identifying outliers
  outliers <- data[data > upper_bound | data < lower_bound]

  # Returning a list with results
  return(list(
    Lower_Bound = lower_bound,
    Upper_Bound = upper_bound,
    Outliers = outliers
  ))
}

