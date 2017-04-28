context("compare clustered results to Stata")

test_that("sampsi 12 16, alpha(.05) power(.8) sd(5)
           sampclus, obsclus(10) rho(0.3)", {
	calc <- twomeans(m1 = 12, m2 = 16, sd = 5) %>% clustered(obsclus = 10, rho = 0.3)
	expect_equal(calc$`n1 (adjusted)`, 93)
	expect_equal(calc$`n2 (adjusted)`, 93)
    expect_equal(calc$`Min. # of clusters`, 10)
})
