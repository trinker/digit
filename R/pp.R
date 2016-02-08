#' Format Percentages
#'
#' A wrapper for \code{\link[digit]{f}} that formats proportions as labeled 
#' percentages.
#'
#' @param x A vector of proportions.
#' @param digits The number of digits to use.  Defaults to 3.  Can be set
#' globally via: \code{options(digit_digits = n)} where n is the number of
#' digits beyond the decimal point to include.
#' @return Returns a string of publication ready digits.
#' @export
#' @seealso \code{\link[digit]{f}}
#' @examples
#' pp(c(30, 33.45, .1))
#' pp(c(30, 33.45, .1), 1)
#' pp(c(0.0, 0, .2, -00.02, 1.122222, pi))
pp <- function(x, digits = getOption("digit_digits")) {
    
    f(x, digits = digits, e="%")
}