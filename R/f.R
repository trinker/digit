#' Format Digits
#'
#' Remove leading zeros and standardize number of digits.
#'
#' @param x A vector of numbers (or string equivalents).
#' @param digits The number of digits to use.  Defaults to 3.  Can be set
#' globally via: \code{options(digit_digits = n)} where n is the number of
#' digits beyond the decimal point to include.
#' @return Returns a string of publication ready digits.
#' @export
#' @seealso \code{\link[digit]{p}}
#' @examples
#' f(c(0.0, 0, .2, -00.02, 1.122222, pi))
#' f(rnorm(10))
#' f(rnorm(20, 100, 200), 0)
#' f(c("-0.23", "0", ".23"))
f <- function(x, digits = getOption("digit_digits")) {

    if (is.null(digits)) digits <- 3

    if(length(digits) > 1) {
        digits <- digits[1]
        warning("Using only digits[1]")
    }

    x <- round(as.numeric(x), digits)

    if (digits > 0) x <- sprintf(paste0("%.", digits, "f"), x)
    out <- gsub("^0(?=\\.)|(?<=-)0", "", x, perl=TRUE)
    out[out == "NA"] <- NA
    out
}

