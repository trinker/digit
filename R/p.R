#' Format P-Values
#'
#' Format p-values for reporting using a < or = sign if greater than alpha level.
#'
#' @param x A p-value.
#' @param alpha The alpha cut off to use.  Defaults to .05.  Can be set
#' globally via: \code{options(digit_alpha = n)} where n is the alpha level.
#' @param digits The number of digits to use.  Defaults to 3.  Can be set
#' globally via: \code{options(digit_digits = n)} where n is the number of
#' digits beyond the decimal point to include.
#' @return Returns a string of publication ready p-values.
#' @export
#' @seealso \code{\link[digit]{f}}
#' @examples
#' p(.05)
#' p(.04999999999999999)
#' p(.0002)
#' p(.0002, .001)
#'
#' mod1 <- t.test(1:10, y = c(7:20))
#' p(mod1$p.value)
#'
#' mod2 <- t.test(1:10, y = c(7:20, 200))
#' p(mod2$p.value)
p <- function(x, alpha = getOption("digit_alpha"),
    digits = getOption("digit_digits")) {

    if (is.null(alpha)) alpha <- .05
    if (is.null(digits)) digits <- 3

    if(length(alpha) > 1) {
        alpha <- alpha[1]
        warning("Using only alpha[1]")
    }

    if (length(x) > 1) {
        x <- x[1]
        warning("Using only x[1]")
    }

    if(alpha < 0 | alpha > 1) {
        alpha <- .05
        warning("alpha not between 0 and 1; using `alpha = .05`")
    }

    less <- as.numeric(x) < alpha

    op <- ifelse(isTRUE(less), "<", "=")
    comp <- ifelse(isTRUE(less),
        sub("^0+(?=\\.)", "", as.numeric(alpha), perl = TRUE), f(x, digits))
    sprintf("p %s %s", op, comp)

}
