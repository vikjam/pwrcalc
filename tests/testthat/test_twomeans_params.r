context("Parameters")

# test_that("effect size or sample size", {
  # expect_equal(twomeans(kappa = 1),
  # 	           "Must specify means (m1 and m2) or sample sizes of the groups (n1 and n2)")
  # expect_error(twomeans(m1 = 3, n1 = 1, n2 = 2),
  # 	           "Must specify means (m1 and m2) or sample sizes of the groups (n1 and n2)")
# })

test_that("non-negative values", {
  expect_error(twomeans(n1 = 0, n2 = 2),
  			   "n1 and n2 must be positive")
  expect_error(twomeans(n1 = 0, n2 = 2),
  			   "n1 and n2 must be positive")
})

