% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/whichTest.R
\name{whichTest}
\alias{whichTest}
\title{Determine the Most Appropriate Statistical Test for your Data}
\usage{
whichTest(data, var1, var2 = NULL, independent = TRUE)
}
\arguments{
\item{data}{A data frame containing the variables to be tested.}

\item{var1}{The first variable in the data frame for which a statistical test is recommended.}

\item{var2}{The second variable (optional) in the data frame for which a statistical test is recommended. Defaults to NULL.}

\item{independent}{A logical value indicating whether groups of data are independent from one another (default is TRUE).}
}
\value{
A string recommending an appropriate parametric and non-parametric statistical test for the provided variables.
}
\description{
This function takes in up to 2 variables from a data frame and, based on the type, levels, and number of the variables.
The function determines whether variables are numeric or categorical, and recommends tests including independent and paired t-tests, ANOVA, and chi-square tests.
Users can use the function checkNorm() in this package to determine whether the parametric or nonparametric options output by this function are most appropriate for analysis.
}
\examples{
df <- data.frame(
number = c(100, 150, 132, 200),
category = c("F", "C", "F", "B"))

whichTest(df, var1 = "number", var2 = "category", independent = TRUE)

}
