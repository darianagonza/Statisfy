#' Perform all Normality Tests and Visualizations
#'
#' This function takes in a numeric variable from a data frame and uses it to run a normality test.
#' At the same time, it outputs a histogram with a normal distribution curve, a QQ plot, and a Shapiro-Wilk test for normality using the input variable.
#'
#' @param data A data frame containing a variable of interest.
#' @param var The name of the numeric variable in the dataset to be checked for normality (typically a dependent variable).
#' @param line_color A character string specifying the color of the normal distribution curve on the histogram and QQ plot that the function will output.
#' @param ... Additional arguments passed to underlying functions
#'
#' @return A message containing the results of the Shapiro-Wilk test for normality and the combined histogram and QQ plot of the variable of interest.
#'
#' @examples
#' df <- data.frame(outcome = rnorm(100))
#' checkNormality(df, outcome, line_color = "red")
#'
#' @export
checkNormality <- function(data,
                      var,
                      line_color,
                      ...){
  # Determine if x is numeric
  var_data <- data |>
    dplyr::pull({{ var }})

  if(!is.numeric(var_data)) {
    stop("The variable must be numeric. Please check your variable type/data class for mistakes and try again.")
  }

  var_data <- stats::na.omit(var_data)

  # Create elements for normal curve
  var_mean <- mean(var_data)
  var_sd <- stats::sd(var_data)

  # Make histogram
  histogram <- ggplot2::ggplot(data, ggplot2::aes(x = var_data)) +
    ggplot2::geom_histogram(color = "black") +
    ggplot2::labs(title = "Histogram",
         x = "Variable",
         y = "Density") +
    ggplot2::theme_minimal()

  qq <- ggplot2::ggplot(data, ggplot2::aes(sample = var_data)) +
    ggplot2::stat_qq() +
    ggplot2::stat_qq_line(color = line_color) +
    ggplot2::labs(title = "QQ Plot",
         x = "Theoretical Quantiles",
         y = "Sample Quantiles") +
    ggplot2::theme_minimal()

  shapiro <- stats::shapiro.test(var_data)
  message("Shapiro-Wilk Test: p-value =", round(shapiro$p.value, 4))

  final <- ggpubr::ggarrange(qq, histogram)

  print(final)
}
