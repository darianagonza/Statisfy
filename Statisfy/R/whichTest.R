#' Determine the Most Appropriate Statistical Test for your Data
#'
#' This function takes in up to 2 variables from a data frame and, based on the type, levels, and number of the variables.
#' The function determines whether variables are numeric or categorical, and recommends tests including independent and paired t-tests, ANOVA, and chi-square tests.
#' Users can use the function checkNorm() in this package to determine whether the parametric or nonparametric options output by this function are most appropriate for analysis.
#'
#' @param data A data frame containing the variables to be tested.
#' @param var1 The first variable in the data frame for which a statistical test is recommended.
#' @param var2 The second variable (optional) in the data frame for which a statistical test is recommended. Defaults to NULL.
#' @param independent A logical value indicating whether groups of data are independent from one another (default is TRUE).
#'
#' @return A string recommending an appropriate parametric and non-parametric statistical test for the provided variables.
#'
#' @examples
#' df <- data.frame(
#' number = c(100, 150, 132, 200),
#' category = c("F", "C", "F", "B"))
#'
#' whichTest(df, var1 = "number", var2 = "category", independent = TRUE)
#'
#' @export
whichTest <- function(data, var1, var2 = NULL, independent = TRUE) {
  # Verify that variables actually exist
  if(!var1 %in% colnames(data) || (!is.null(var2) && !var2 %in% colnames(data))) {
    stop("Variable not found in your dataset.")
  }

  # Check class of variables to suggest appropriate test
  var1_type <- if(is.numeric(data[[var1]])) {
    "numeric"
  } else if(is.character(data[[var1]]) || is.factor(data[[var1]])) {
    "categorical"
  } else {
    stop("This variable type is not supported. Please check your variable type for errors and try again.")
  }

  if(!is.null(var2)) {
    var2_type <- if(is.numeric(data[[var2]])) {
      "numeric"
    } else if(is.character(data[[var2]]) || is.factor(data[[var2]])) {
      "categorical"
    } else {
      stop("This variable type is not supported. Please check your variable type for errors
      and try again.")
    }

    # Make sure that the order of variables does not change the output of the function
    if(var1_type == "categorical" && var2_type == "numeric") {
      placeholder <- var1
      var1 <- var2
      var2 <- placeholder
      var1_type <- "numeric"
      var2_type <- "categorical"
    }
  }

  # Recommend test types based on variable types
  if(is.null(var2)) {
    if(var1_type == "numeric") {
      return(paste("Test for normality using a Shapiro-Wilk Test or obtain descriptive",
                   "statistics of your data using summary()"))
    } else if(var1_type == "categorical") {
      return(paste("Visualize patterns in your data using a bar chart or pie chart."))
    }
  } else {
    if(var1_type == "numeric" && var2_type == "numeric") {
      return(paste("Test for correlation between both variables using a Pearson Correlation Test",
                   "(normal distribution) or Spearman Correlation Test (not normal distribution).",
                   "To test how one variable predicts the outcome of another variable, try a",
                   "Linear Regression."))
    } else if(var1_type == "numeric" && var2_type == "categorical") {
      levels <- length(unique(data[[var2]][!is.na(data[[var2]])]))
      if(levels == 2) {
        if(independent) {
          return(paste("Use an Independent t-Test (normal distribution) to understand whether",
                       "2 groups are significantly different from one another. Use a Mann-Whitney",
                       "U Test if distribution is not normal."))
        } else {
          return(paste("Use a Paired t-Test to test whether measurements from the same object",
                       "or related units are different from one another (normal distribution).",
                       "Use a Wilcoxon Signed-Rank Test if distribution is not normal."))
        }
      } else if(levels > 2) {
        return(paste("Use a One-Way ANOVA to determine whether there are significant differences",
                     "between 3+ groups (normal distribution). Use a Kruskal-Wallis Test",
                     "if data is not normally distributed."))
      }
    } else if(var1_type == "categorical" && var2_type == "categorical") {
      return(paste("Use a Chi-Square Test of Independence to determine whether differences",
                   "between two categorical variables are due to chance or a relationship",
                   "between the two."))
    }
  }
  stop("This function is not prepared to suggest an appropriate test for these variables.")
}

