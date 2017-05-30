context("compare twomeans results to Stata")

test_that("sampsi 12 16, sd(5) power(0.8)", {
	calc <- twomeans(m1 = 12, m2 = 16, sd = 5)
	expect_equal(calc$n1, 25)
	expect_equal(calc$n2, 25)
})

test_that("sampsi 12 15, sd1(5) sd2(7) r(0.5) power(0.8)", {
    calc <- twomeans(m1 = 12, m2 = 15, nratio = 0.5, sd1 = 5, sd2 = 7)
    expect_equal(calc$n1, 108)
    expect_equal(calc$n2, 54)
})

