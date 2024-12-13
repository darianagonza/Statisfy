% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/outliers.R
\name{outliers}
\alias{outliers}
\title{Easily Detect Outliers}
\usage{
outliers(data, upper = 0.99, lower = 0.01)
}
\arguments{
\item{data}{A numeric variable containing the data to be analyzed.}

\item{upper}{A numeric value (default = .99) indicating the upper quantile threshold for outlier detection.}

\item{lower}{A numeric value (default = .01) indicating the lower quantile threshold for outlier detection.}
}
\value{
A list containing: the lower bound, the upper bound, and a vector of values identified as outliers.
}
\description{
This function identifies outliers in a numeric dataset based on specified quantile thresholds.
The function takes in an upper and lower quantile to determine the bounds for detecting outliers and outputs a vector of outliers.
}
\examples{
data <- c(1, 5, 2, 14, 1, 50)
outliers(data, upper = 0.95, lower = 0.05)

}
