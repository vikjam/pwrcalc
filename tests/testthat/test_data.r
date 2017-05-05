context("Check balsakhi data")

test_that("Number of rows", {
  data(balsakhi)
  expect_equal(nrow(balsakhi), 10198)
})

test_that("Number of columns", {
  data(balsakhi)
  expect_equal(ncol(balsakhi), 76)
})

test_that("Mean of post_totnorm in control group", {
  data(balsakhi)
  expect_equal(mean(balsakhi[which(balsakhi$bal == 0), "post_totnorm"],
                    na.rm = TRUE),
               0.4288781)
})

test_that("Standard deviation of post_totnorm in control group", {
  data(balsakhi)
  expect_equal(sd(balsakhi[which(balsakhi$bal == 0), "post_totnorm"],
                  na.rm = TRUE),
               1.15142,
               tolerance = 1e-6)
})

