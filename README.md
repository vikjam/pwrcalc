# pwrcalc

Power calculations in R that produce results familiar to Stata users.

[![Travis-CI Build Status](https://travis-ci.org/vikjam/pwrcalc.svg?branch=master)](https://travis-ci.org/vikjam/pwrcalc) [![Documentation Status](https://readthedocs.org/projects/pwrcalc/badge/?version=latest)](http://pwrcalc.readthedocs.io/en/latest/?badge=latest) [![Join the chat at https://gitter.im/pwrcalc/Lobby](https://badges.gitter.im/pwrcalc/Lobby.svg)](https://gitter.im/pwrcalc/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Quick Start
Check out the [Read the Docs](http://pwrcalc.readthedocs.io/en/latest/?badge=latest) page for more detailed information.

### Installation

Using the R package [`devtools`](https://www.rstudio.com/products/rpackages/devtools/), you can easily install `pwrcalc`.
```{r}
devtools::install_github('vikjam/pwrcalc')
```

`devtools`includes a lot of extras functionality and dependencies. Alternatively, you just want to use [`ghit`](https://github.com/cloudyr/ghit). 
```{r}
ghit::install_github('vikjam/pwrcalc')
```

If you'd prefer installing the package without `devtools` or `ghit`, you can download the [latest release](https://github.com/vikjam/pwrcalc/releases) and [install the zipped packaged](http://outmodedbonsai.sourceforge.net/InstallingLocalRPackages.html).

### Usage
Suppose we want to detect a difference of 4 between two groups (e.g., control and treatment). For example, we anticipate the control group mean being 12 and the treatment group mean being 16. In addition, suppose the standard deviation of each group is 5. We can calculate the sample size required with `pwrcalc`,

```{r}
library(pwrcalc)
twomeans(m1 = 12, m2 = 16, sd = 5)
```
which gives us the following output.
```{r}
     Two-sample t-test power calculation 

             m1 = 12
             m2 = 16
             n1 = 25
             n2 = 25
      sig.level = 0.05
          power = 0.8
    alternative = two.sided

NOTE: m1 and m2 are the means of group 1 and 2, respectively.
n1 and n2 are the obs. of group 1 and 2, respectively.
```
Now suppose we're worried about correlation between clusters. Then use the `clustered` command to account for the correlation,
```{r}
twomeans(m1 = 12, m2 = 16, sd = 5) %>% clustered(obsclus = 10, rho = 0.3)
```
which tells us we'll need a larger sample to detect the same effect.
```{r}
     Two-sample t-test power calculation 

                m1 = 12
                m2 = 16
   n1 (unadjusted) = 25
   n2 (unadjusted) = 25
     n1 (adjusted) = 93
     n2 (adjusted) = 93
               rho = 0.3
  Avg. per cluster = 93
Min. # of clusters = 10
         sig.level = 0.05
             power = 0.8
       alternative = two.sided

NOTE: m1 and m2 are the means of group 1 and 2, respectively.
n1 and n2 are the obs. of group 1 and 2, respectively.
```

