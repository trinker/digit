context("Checking pc")

test_that("pc ...",{

    expect_true(nchar(pc(123456789)) == 11)

})

