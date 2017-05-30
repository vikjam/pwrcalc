context("compare clustered results to Stata")

test_that("sampsi 12 16, alpha(.05) power(.8) sd(5)
           sampclus, obsclus(10) rho(0.3)", {
	calc <- twomeans(m1 = 12, m2 = 16, sd = 5) %>% clustered(obsclus = 10, rho = 0.3)
	expect_equal(calc$`Average per cluster`, 10)
  expect_equal(calc$`Mininum number of clusters`, 19)
  expect_equal(calc$`n2 (adjusted)`, 93)
  expect_equal(calc$`n2 (adjusted)`, 93)
})

test_that("sampsi 200 185, alpha(.05) power(.8) sd(30)
           sampclus, numclus(40) rho(.05)", {
  calc <- twomeans(m1 = 200, m2 = 185, sd = 30) %>% clustered(numclus = 40, rho = 0.05)
  expect_equal(calc$`Average per cluster`, 4)
  expect_equal(calc$`Mininum number of clusters`, 40)
  expect_equal(calc$`n2 (adjusted)`, 73)
  expect_equal(calc$`n2 (adjusted)`, 73)
})

