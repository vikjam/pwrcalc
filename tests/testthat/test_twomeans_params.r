context("twomeans parameters")

# test_that("effect size or sample size", {
  # expect_equal(twomeans(kappa = 1),
  #                "Must specify means (m1 and m2) or sample sizes of the groups (n1 and n2)")
  # expect_error(twomeans(m1 = 3, n1 = 1, n2 = 2),
  #                "Must specify means (m1 and m2) or sample sizes of the groups (n1 and n2)")
# })

test_that("non-negative values", {
  expect_error(twomeans(n1 = 0, n2 = 2, sd = 5),
               "n1 and n2 must be positive")
  expect_error(twomeans(n1 = 0, n2 = 2, sd = 5),
               "n1 and n2 must be positive")
  expect_error(twomeans(m1 = 12, m2 = 16, sd = 0),
               "sd must be positive")
})

test_that("valid intervals", {
  expect_error(twomeans(m1 = 12, m2 = 16, sd = 5, sig.level = 3),
               "sig.level and power must fall between 0 and 1")
  expect_error(twomeans(m1 = 12, m2 = 16, sd = 5, power = 3),
               "sig.level and power must fall between 0 and 1")
})

test_that("specify standard errors", {
  expect_error(twomeans(m1 = 12, m2 = 16, sd = 5, sd1 = 5),
               "must specific either just sd or sd1 and sd2")
  expect_error(twomeans(m1 = 12, m2 = 16, sd1 = 5),
               "must specific either just sd or sd1 and sd2")
  expect_error(twomeans(m1 = 12, m2 = 16),
               "must specific either just sd or sd1 and sd2")
})

