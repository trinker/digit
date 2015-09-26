context("Checking f")

test_that("f strips eading zeros and formats decimal places",{

    x <- f(c(0.0, 0, .2, -00.02, 1.122222, pi, "A"))
    expect_equal(x, c(".000", ".000", ".200", "-.020", "1.122", "3.142", NA))

    expect_warning(f(c(0.0, 0, .2, -00.02, 1.122222, pi, "A")))
})

test_that("f throws proper warnings.",{

    expect_warning(f(.3, c(2, 3)))

})

test_that("f with s works",{

    expect_true(all(grepl("%$", f(c(30, 33.45, .1), 1, e="%"))))

})


test_that("f with e works",{

    expect_true(all(grepl("^\\$", f(c(30, 33.45, .1), 2, s="$"))))
})
