========================
Basic Parametric example
========================

Load the included Balsakhi data set, which we'll use to estimate the control mean.

.. code-block:: r

    library(pwrcalc)
    data(balsakhi)
    control_mean <- mean(subset(balsakhi$post_totnorm, balsakhi$bal == 0), na.rm = TRUE)
    control_sd   <- sd(subset(balsakhi$post_totnorm, balsakhi$bal == 0), na.rm = TRUE)

Let's inspect the results to make sure we're all on the same page.

.. code-block:: rconsole

    > print(control_mean)
    [1] 0.4288781
    > print(control_sd)
    [1] 1.15142

Let's say, based on other studies, that we expect an effect size of a tenth of a standard deviation. Now let's calculate the sample size given that we know the likely effect size.

.. code-block:: r

    expected_effect <- control_sd / 10
    treated_mean    <- expected_effect + control_mean

We can now calculate the sample size needed to test that hypothesis.

.. code-block:: rconsole

    > twomeans(m1 = control_mean, m2 = treated_mean, sd = control_sd)

         Two-sample t-test power calculation 

                 m1 = 0.4288781
                 m2 = 0.5440201
                 n1 = 1570
                 n2 = 1570
          sig.level = 0.05
              power = 0.8
        alternative = two.sided

    NOTE: 
    m1 and m2 are the means of group 1 and 2, respectively.
    n1 and n2 are the obs. of group 1 and 2, respectively.
