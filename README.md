digit
============


[![Build
Status](https://travis-ci.org/trinker/digit.svg?branch=master)](https://travis-ci.org/trinker/digit)
[![Coverage
Status](https://coveralls.io/repos/trinker/digit/badge.svg?branch=master)](https://coveralls.io/r/trinker/digit?branch=master)

<a href="https://img.shields.io/badge/Version-0.0.1-orange.svg"><img src="https://img.shields.io/badge/Version-0.0.1-orange.svg" alt="Version"/></a>
</p>
**digit** contains tools to assist in the formatting of numbers for
publication. Tools include the removal of leading zeros, standardization
of number of digits, and a p-value formatter.


Table of Contents
============

-   [Installation](#installation)
-   [Contact](#contact)
-   [Demonstration](#demonstration)

Installation
============


To download the development version of **digit**:

Download the [zip ball](https://github.com/trinker/digit/zipball/master)
or [tar ball](https://github.com/trinker/digit/tarball/master),
decompress and run `R CMD INSTALL` on it, or use the **pacman** package
to install the development version:

    if (!require("pacman")) install.packages("pacman")
    pacman::p_load_gh("trinker/digit")

Contact
=======

You are welcome to: 
* submit suggestions and bug-reports at: <https://github.com/trinker/digit/issues> 
* send a pull request on: <https://github.com/trinker/digit/> 
* compose a friendly e-mail to: <tyler.rinker@gmail.com>


Demonstration
=============

    f(c(0.0, 0, .2, -00.02, 1.122222, pi, "A"))

    ## Warning in f(c(0, 0, 0.2, -0.02, 1.122222, pi, "A")): NAs introduced by
    ## coercion

    ## [1] ".000"  ".000"  ".200"  "-.020" "1.122" "3.142" NA

We can see it's use in actual model reproting as well:

    mod1 <- t.test(1:10, y = c(7:20))
    sprintf(
        "t = %s (%s)",
        f(mod1$statistic),
        p(mod1$p.value)
    )

    ## [1] "t = -5.435 (p < .05)"

    mod2 <- t.test(1:10, y = c(7:20, 200))

    sprintf(
        "t = %s (%s)",
        f(mod2$statistic, 2),
        p(mod2$p.value, digits = 2)
    )

    ## [1] "t = -1.63 (p = .12)"

We can build a function to reprot model statistics:

    report <- function(mod, stat = NULL, digits = c(0, 2, 2)) {
        
        stat <- if (is.null(stat)) stat <- names(mod[["statistic"]])
        sprintf(
            "%s(%s) = %s, %s", 
            stat,
            paste(f(mod[["parameter"]], digits[1]), collapse = ", "),
            f(mod[["statistic"]], digits[2]),
            p(mod[["p.value"]], digits = digits[3])
        )

    }

    report(mod1)

    ## [1] "t(22) = -5.43, p < .05"

    report(oneway.test(count ~ spray, InsectSprays))

    ## [1] "F(5, 30) = 36.07, p < .05"

    report(chisq.test(matrix(c(12, 5, 7, 7), ncol = 2)))

    ## [1] "X-squared(1) = .64, p = .42"

This enables in-text usage as well. First set up the models in a code
chunk:

    mymod <- oneway.test(count ~ spray, InsectSprays)

And then use <code class="r">`` `r report(mymod)` ``</code> resuting in
a report that looks like this: F(5, 30) = 36.07, p \< .05