#' Comma Format Large Integers
#'
#' Add commas to larger integers.
#'
#' @param x A vector opc numbers (or string equivalents).
#' @param big.mark The character to include every n places.
#' @param \ldots Other arguments passed to \code{\link[base]{prettyNum}}.
#' @return Returns a comma separted string of publication ready digits.
#' @export
#' @seealso \code{\link[base]{prettyNum}}
#' @examples
#' set.seed(4)
#' pc(sample(4:10, 5)^5)
#' ## pc(sample(4:10, 5)^5, ".")
pc <- function(x, big.mark = ",", ...) {

    prettyNum(x, big.mark, ...)
}
