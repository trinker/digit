% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pp.R
\name{pp}
\alias{pp}
\title{Format Percentages}
\usage{
pp(x, digits = getOption("digit_digits"))
}
\arguments{
\item{x}{A vector of proportions.}

\item{digits}{The number of digits to use.  Defaults to 3.  Can be set
globally via: \code{options(digit_digits = n)} where n is the number of
digits beyond the decimal point to include.}
}
\value{
Returns a string of publication ready digits.
}
\description{
A wrapper for \code{\link[digit]{f}} that formats proportions as labeled 
percentages.
}
\examples{
pp(c(30, 33.45, .1))
pp(c(30, 33.45, .1), 1)
pp(c(0.0, 0, .2, -00.02, 1.122222, pi))
}
\seealso{
\code{\link[digit]{f}}
}

