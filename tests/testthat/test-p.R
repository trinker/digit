context("Checking p")

test_that("p gives =/< and p.value/alpha.",{

    expect_equal(p(.0513), "p = .051")
    expect_equal(p(.04999999999999999), "p < .05")
})

test_that("p throws proper warnings.",{

    expect_warning(p(.2, c(.05, .01)))
    expect_warning(p(.2, 1.1))
    expect_warning(p(c(.3, .5)))
})

