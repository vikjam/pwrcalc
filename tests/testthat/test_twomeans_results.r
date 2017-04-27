context("Compare results to Stata")

test_that("sampsi 12 16, sd(5) power(0.8)", {
	calc <- twomeans(m1 = 12, m2 = 16, sd = 5)
	expect_equal(calc$n1, 25)
	expect_equal(calc$n2, 25)
})
